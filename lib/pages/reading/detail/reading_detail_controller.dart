import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/classes/test_excel_model.dart';
import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';

import 'package:japanese_practise_n5/pages/reading/detail/reading_detail.dart';
import 'package:japanese_practise_n5/pages/reading/list/reading_state.dart';
import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final readingDetailController =
    StateNotifierProvider<ReadingDetailController, ReadingState>(
        (ref) => ReadingDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class ReadingDetailController extends StateNotifier<ReadingState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  ReadingDetailController({required this.ref}) : super(const ReadingState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  ReadingState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const ReadingState();

  //#endregion ---------- facility ----------
  // Future readXlReadingTest(xlName) async {
  //   List<XlTestExerciseModel> lstTestData = [];
  //   List<String> vocabularies = ["ШИНЭ ҮГ"];
  //   ByteData data = await rootBundle.load("test/$xlName.xlsx");
  //   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   var excel = Excel.decodeBytes(bytes);

  //   for (var i = 1; i < excel.tables["Sheet1"]!.rows.length; i++) {
  //     var row = excel.tables["Sheet1"]!.rows[i];

  //     int trueAnswerIndex = int.parse(getCellValue(row[5]));

  //     List<XlTestAnswersModel> lstAnswers = [];
  //     for (var i = 1; i < 5; i++) {
  //       var answer = XlTestAnswersModel()
  //         ..answer = getCellValue(row[i])
  //         ..isTrue = trueAnswerIndex == i;
  //       lstAnswers.add(answer);
  //     }
  //     var vocabulary = XlTestExerciseModel()
  //       ..question = getCellValue(row[0])
  //       ..answers = lstAnswers;

  //     lstTestData.add(vocabulary);
  //   }

  //   final newData = <String, dynamic>{
  //     'jlptLevel': jlptLevel,
  //     'name': xlName,
  //     'reference': "",
  //     'exercises': lstTestData.map((test) => {
  //           'question': test.question,
  //           'answers': test.answers.map((quest) => {
  //                 'answer': quest.answer,
  //                 'isTrue': quest.isTrue,
  //               }),
  //         }),
  //     'vocabularies': vocabularies,
  //     'time': DateTime.now().microsecondsSinceEpoch
  //   };

  //   await _database
  //       .child('KanjiTest')
  //       .push()
  //       .set(newData)
  //       .catchError((onError) {
  //     print('could not saved data');
  //     throw ("aldaa garlaa");
  //   });
  // }

  Future<void> writeNew(String key, String exerciseName,
      List<ReadingDetailItem> lstExercises, List<String> vocabularies) async {
    List<Reading> lstReadingExercises = [];
    for (var readingEx in lstExercises) {
      var section = readingEx.txtName.controller.text;
      var content = readingEx.txtContent.controller.text;
      var questions = readingEx.lstQuestionWidgets.lstQuestion
          .map((question) => Question(
                question.questionWidget.controller.text,
                question.answerWidget.lstAnswer
                    .map((e) => AnswerOption(
                        e.field.controller.text, e.checkField.isChecked))
                    .toList(),
              ))
          .toList();

      Reading reading = Reading(section, content, questions);
      lstReadingExercises.add(reading);
    }

    List<Map<String, dynamic>> lstSendItem = [];
    lstReadingExercises.map((e) {
      lstSendItem.add({
        'section': e.section,
        'content': e.content,
        'questions': e.questions.map((quest) => {
              'question': quest.question,
              'answers': quest.answers.map((quest) => {
                    'answer': quest.answer,
                    'isTrue': quest.isTrue,
                  }),
            }),
      });
    }).toList();

    final newData = <String, dynamic>{
      'jlptLevel': jlptLevel,
      'name': exerciseName,
      'exercises': lstSendItem,
      'vocabularies': vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      await _database
          .child('ReadingTest')
          .push()
          .set(newData)
          .catchError((onError) {
        print('could not saved data');
        throw ("aldaa garlaa");
      });
    } else {
      var _todoQuery = _database.child("/ReadingTest");
      await _todoQuery.child("/$key").set(newData).catchError((onError) {
        print('could not update data');
        throw ("aldaa garlaa");
      });
    }
  }
}
