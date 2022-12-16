import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/classes/test_excel_model.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final grammarDetailController =
    StateNotifierProvider<GrammarDetailController, GrammarState>(
        (ref) => GrammarDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class GrammarDetailController extends StateNotifier<GrammarState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  GrammarDetailController({required this.ref}) : super(const GrammarState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  GrammarState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const GrammarState();

  Future<GrammarState?> getCancellationPolicyDetail(String uniqueId) async {
    // final response = await ref
    //     .read(facilityApiProvider)
    //     .gqlGetCancellationPolicyDetail(uniqueId);

    // if (response == null) return null;
    // state = response;

    return state;
  }

  //#endregion ---------- facility ----------

  Future readXlGrammarTest(xlName) async {
    print("xlName:$xlName");
    List<XlTestExerciseModel> lstTestData = [];
    List<String> vocabularies = ["ШИНЭ ҮГ"];
    ByteData data = await rootBundle.load("test/$xlName.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var i = 1; i < excel.tables["Sheet1"]!.rows.length; i++) {
      var row = excel.tables["Sheet1"]!.rows[i];

      int trueAnswerIndex = int.parse(getCellValue(row[5]));

      List<XlTestAnswersModel> lstAnswers = [];
      for (var i = 1; i < 5; i++) {
        print(i);
        var answer = XlTestAnswersModel()
          ..answer = getCellValue(row[i])
          ..isTrue = trueAnswerIndex == i;
        lstAnswers.add(answer);
      }
      var vocabulary = XlTestExerciseModel()
        ..question = getCellValue(row[0])
        ..answers = lstAnswers;

      lstTestData.add(vocabulary);
    }

    final newData = <String, dynamic>{
      'jlptLevel': jlptLevel,
      'name': xlName,
      'reference': "",
      'exercises': lstTestData.map((test) => {
            'question': test.question,
            'answers': test.answers.map((quest) => {
                  'answer': quest.answer,
                  'isTrue': quest.isTrue,
                }),
          }),
      'vocabularies': vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };

    await _database
        .child('GrammarTest')
        .push()
        .set(newData)
        .catchError((onError) {
      print('could not saved data');
      throw ("aldaa garlaa");
    });
  }

  //#region ---------- save ----------
  Future<void> writeNew(String key, String exerciseName,
      List<QuestionItem> lstExercises, List<String> vocabularies) async {
    final newData = <String, dynamic>{
      'jlptLevel': jlptLevel,
      'name': exerciseName,
      'exercises': lstExercises.map((quest) => {
            'question': quest.questionWidget.controller.text,
            'answers': quest.answerWidget.lstAnswer.map((quest) => {
                  'answer': quest.field.controller.text,
                  'isTrue': quest.checkField.isChecked,
                }),
          }),
      'vocabularies': vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      await _database
          .child('GrammarTest')
          .push()
          .set(newData)
          .catchError((onError) {
        print('could not saved data');
        throw ("aldaa garlaa");
      });
    } else {
      var _todoQuery = _database.child("/GrammarTest");
      await _todoQuery.child("/$key").set(newData).catchError((onError) {
        print('could not update data');
        throw ("aldaa garlaa");
      });
    }
  }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
