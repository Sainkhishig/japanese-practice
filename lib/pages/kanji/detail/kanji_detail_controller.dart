import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/pages/kanji/list/kanji_state.dart';

final kanjiDetailController =
    StateNotifierProvider<KanjiDetailController, KanjiState>(
        (ref) => KanjiDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class KanjiDetailController extends StateNotifier<KanjiState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  KanjiDetailController({required this.ref}) : super(const KanjiState());
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
  void writeNew(String key, String exerciseName,
      List<QuestionItem> lstExercises, List<String> vocabularies) {
    final newData = <String, dynamic>{
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
      _database
          .child('KanjiExercises')
          .push()
          .set(newData)
          .then((value) => {
                print('new data written'),
              })
          .catchError((onError) {
        print('could not saved data');
      });
    } else {
      var _todoQuery = _database.child("/KanjiExercises");
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
