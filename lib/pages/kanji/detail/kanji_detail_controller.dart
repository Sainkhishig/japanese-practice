import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/classes/test_excel_model.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';
import 'package:japanese_practise_n5/pages/kanji/list/kanji_state.dart';
import 'package:japanese_practise_n5/pages/kanji/model/kanji_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final kanjiDetailController =
    StateNotifierProvider<KanjiDetailController, KanjiState>(
        (ref) => KanjiDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class KanjiDetailController extends StateNotifier<KanjiState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  KanjiDetailController({required this.ref}) : super(const KanjiState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  KanjiState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const KanjiState();

  Future<KanjiState?> getCancellationPolicyDetail(String uniqueId) async {
    // final response = await ref
    //     .read(facilityApiProvider)
    //     .gqlGetCancellationPolicyDetail(uniqueId);

    // if (response == null) return null;
    // state = response;

    return state;
  }

  //#endregion ---------- facility ----------
  //#region ---------- save ----------

  Future readXlKanjiTest(xlName) async {
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
        .child('KanjiTest')
        .push()
        .set(newData)
        .catchError((onError) {
      print('could not saved data');
      throw ("aldaa garlaa");
    });
  }

  Future<void> writeNew(
      KanjiExercise? saveData, List<QuestionItem> lstExercises) async {
    final newData = <String, dynamic>{
      'jlptLevel': jlptLevel,
      'name': saveData!.name,
      'reference': saveData.reference,
      'exercises': lstExercises.map((quest) => {
            'question': quest.questionWidget.controller.text,
            'answers': quest.answerWidget.lstAnswer.map((quest) => {
                  'answer': quest.field.controller.text,
                  'isTrue': quest.checkField.isChecked,
                }),
          }),
      'vocabularies': saveData.vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (saveData.key.isEmpty) {
      await _database
          .child('KanjiTest')
          .push()
          .set(newData)
          .catchError((onError) {
        print('could not saved data');
        throw ("aldaa garlaa");
      });
    } else {
      var _todoQuery = _database.child("/KanjiTest");
      await _todoQuery
          .child("/${saveData.key}")
          .set(newData)
          .catchError((onError) {
        print('could not update data');
        throw ("aldaa garlaa");
      });
    }
  }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
