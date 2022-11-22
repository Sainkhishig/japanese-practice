import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/common/widget/question_add_list.dart';
import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';
import 'package:japanese_practise_n5/pages/vocabulary/list/vocabulary_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final vocabularyDetailController =
    StateNotifierProvider<VocabularyDetailController, VocabularyState>(
        (ref) => VocabularyDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class VocabularyDetailController extends StateNotifier<VocabularyState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  VocabularyDetailController({required this.ref})
      : super(const VocabularyState()) {
    prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  VocabularyState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const VocabularyState();

  Future<VocabularyState?> getCancellationPolicyDetail(String uniqueId) async {
    // final response = await ref
    //     .read(facilityApiProvider)
    //     .gqlGetCancellationPolicyDetail(uniqueId);

    // if (response == null) return null;
    // state = response;

    return state;
  }

  //#endregion ---------- facility ----------
  //#region ---------- save ----------
  Future<void> writeNew(String key, String exerciseName,
      List<QuestionItem> lstExercises, List<String> vocabularies) async {
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
      'jlptLevel': jlptLevel,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      await _database
          .child('VocabularyTest')
          .push()
          .set(newData)
          .catchError((onError) {
        print('could not saved data');
        throw ("aldaa garlaa");
      });
    } else {
      var _todoQuery = _database.child("/VocabularyTest");
      await _todoQuery.child("/$key").set(newData).catchError((onError) {
        print('could not update data');
        throw ("aldaa garlaa");
      });
    }
  }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
