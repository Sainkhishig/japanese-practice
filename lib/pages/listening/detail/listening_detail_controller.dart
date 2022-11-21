import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:japanese_practise_n5/pages/listening/detail/listening_detail.dart';
import 'package:japanese_practise_n5/pages/listening/list/listening_state.dart';
import 'package:japanese_practise_n5/pages/listening/model/listening_model.dart';

final listeningDetailController =
    StateNotifierProvider<ListeningDetailController, ListeningState>(
        (ref) => ListeningDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class ListeningDetailController extends StateNotifier<ListeningState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  ListeningDetailController({required this.ref})
      : super(const ListeningState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  ListeningState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const ListeningState();

  //#endregion ---------- facility ----------
  void update() {
    var _todoQuery = _database.child("/rListening");
    _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
      'age': '29',
      'email': 'updari.ariuka67@gmail.com',
      'mobile': '07083539202',
      'name': 'Sainkhishig Ariunaa',
      'time': DateTime.now().microsecondsSinceEpoch
    });
  }

  void writeNew(String key, String exerciseName,
      List<ListeningDetailItem> lstExercises, List<String> vocabularies) {
    List<ListeningSection> lstListeningExercises = [];
    for (var listeningEx in lstExercises) {
      var section = listeningEx.txtName.controller.text;
      var content = listeningEx.txtContent.controller.text;
      var questions = listeningEx.lstQuestionWidgets.lstQuestion
          .map((question) => ListeningQuestion(
                question.questionWidget.controller.text,
                question.answerWidget.lstAnswer
                    .map((e) => ListeningAnswerOption(
                        e.field.controller.text, e.checkField.isChecked))
                    .toList(),
              ))
          .toList();

      ListeningSection listening =
          ListeningSection(section, content, questions);
      lstListeningExercises.add(listening);
    }

    List<Map<String, dynamic>> lstSendItem = [];
    lstListeningExercises.map((e) {
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
          .child('ListeningExercises')
          .push()
          .set(newData)
          .then((value) => {
                print('new data written'),
              })
          .catchError((onError) {
        print('could not saved data');
      });
    } else {
      var _todoQuery = _database.child("/ListeningExercises");
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
