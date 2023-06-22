import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/classes/test_excel_model.dart';
import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';
import 'package:japanese_practise_n5/pages/tutorial/tutorial_scene_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tutorialSceneController =
    StateNotifierProvider<TutorialSceneController, TutorialSceneState>(
        (ref) => TutorialSceneController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class TutorialSceneController extends StateNotifier<TutorialSceneState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}
  final _database = FirebaseDatabase.instance.reference();
  //#region ==================== constructor ====================
  TutorialSceneController({required this.ref})
      : super(const TutorialSceneState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  TutorialSceneState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const TutorialSceneState();
  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  Future<void> getAllTutorial() async {
    var ref = _database.child("/Tutorial");
    var rtdb = await ref.once();

    if (rtdb.value == null) return;
    print("has result");
    final rtdbVal = Map<String, dynamic>.from(rtdb.value);
    state = state.copyWith(lstAllTutorial: rtdbVal);

    // rtdbVal.forEach((keyUser, value) {
    //   // print("key:$keyUser");
    //   // print("value:$value");
    //   // print("tutorial:${value["tutorial"]["title"]}");
    //   // print("tutorial2:${value["tutorial"]["title"]}");

    //   // final grammarTest =
    //   //     ReadingTestModel.fromRTDB(Map<String, dynamic>.from(value));
    //   // final testResult = Dictionary.fromJson(value);
    //   // lstTest.add(testResult);

    //   // dictionaryBox.add(testResult);
    // });

    // return state;
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

  //#endregion ==================== method ====================
}
