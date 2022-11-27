import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
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
