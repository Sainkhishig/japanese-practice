import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/widget/listening_question_add_list.dart';

import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final listeningDetailController =
    StateNotifierProvider<ListeningDetailController, GrammarState>(
        (ref) => ListeningDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class ListeningDetailController extends StateNotifier<GrammarState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  ListeningDetailController({required this.ref}) : super(const GrammarState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  GrammarState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const GrammarState();

  //#endregion ---------- facility ----------
  //#region ---------- save ----------
  void writeNew(
      String key,
      String exerciseName,
      List<ListeningQuestionItem> lstExercises,
      List<String> vocabularies,
      String storagePath) {
    List<Map<String, dynamic>> lstSendItem = [];

    final newData = <String, dynamic>{
      'jlptLevel': jlptLevel,
      'name': exerciseName,
      'storagePath': storagePath,
      'exercises': lstExercises.map((quest) => {
            'question': quest.questionWidget.controller.text,
            'audioUrl': quest.audioUrl ?? "",
            'imageUrl': quest.imageUrl ?? "",
            'answers': quest.answerWidget.lstAnswer.map((quest) => {
                  'answer': quest.field.controller.text,
                  'isTrue': quest.checkField.isChecked,
                }),
          }),
      'vocabularies': vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      _database
          .child('ListeningTest')
          .push()
          .set(newData)
          .then((value) => {
                print('new data written'),
              })
          .catchError((onError) {
        print('could not saved data');
      });
    } else {
      var _todoQuery = _database.child("/ListeningTest");
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

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
