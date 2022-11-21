import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
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

  void writeNew(String key, String exerciseName,
      List<ReadingDetailItem> lstExercises, List<String> vocabularies) {
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
      'level': jlptLevel,
      'name': exerciseName,
      'exercises': lstSendItem,
      'vocabularies': vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      _database
          .child('ReadingExercises')
          .push()
          .set(newData)
          .then((value) => {
                print('new data written'),
              })
          .catchError((onError) {
        print('could not saved data');
      });
    } else {
      var _todoQuery = _database.child("/ReadingExercises");
      _todoQuery
          .child("/$key")
          .set(newData)
          .then((value) => {
                print(' data updated'),
              })
          .catchError((onError) {
        print('could not update data');
      });
    }
  }
}
