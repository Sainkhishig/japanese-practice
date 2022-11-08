import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:japanese_practise_n5/pages/reading/detail/reading_detail.dart';
import 'package:japanese_practise_n5/pages/reading/list/reading_state.dart';
import 'package:japanese_practise_n5/pages/reading/model/reading_model.dart';

final readingDetailController =
    StateNotifierProvider<ReadingDetailController, ReadingState>(
        (ref) => ReadingDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class ReadingDetailController extends StateNotifier<ReadingState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  ReadingDetailController({required this.ref}) : super(const ReadingState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  ReadingState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const ReadingState();

  //#endregion ---------- facility ----------
  void update() {
    var _todoQuery = _database.child("/rReading");
    _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
      'age': '29',
      'email': 'updari.ariuka67@gmail.com',
      'mobile': '07083539202',
      'name': 'Sainkhishig Ariunaa',
      'time': DateTime.now().microsecondsSinceEpoch
    });
  }

  void writeNew(String key, String exerciseName,
      List<ReadingDetailItem> lstExercises, List<String> vocabularies) {
    List<Reading> lstReadingExercises = [];
    for (var readingEx in lstExercises) {
      var section = readingEx.txtName.controller.text;
      var content = readingEx.txtContent.controller.text;
      var questions = readingEx.lstQuestionWidgets.lstQuestion
          .map((question) => Question(
                question.question.controller.text,
                question.answers.lstAnswer
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
