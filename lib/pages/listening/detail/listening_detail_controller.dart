import 'package:firebase_storage/firebase_storage.dart';
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
  Future<void> writeNew(
      String key,
      String exerciseName,
      List<ListeningQuestionItem> lstExercises,
      List<String> vocabularies,
      String storagePath) async {
    List<Map<String, dynamic>> lstSendItem = [];

    final storageRef = FirebaseStorage.instance.ref();

    for (var item in lstExercises) {
      if (item.audioPath != null && item.audioPath!.isNotEmpty) {
        String audioUrlPath = item.audioPath ?? "";
        item.audioUrl = await storageRef.child(audioUrlPath).getDownloadURL();
      }
      if (item.imagePath != null && item.imagePath!.isNotEmpty) {
        String imgUrlPath = item.imagePath ?? "";
        item.imageUrl = await storageRef.child(imgUrlPath).getDownloadURL();
      }
    }
    final newData = <String, dynamic>{
      'jlptLevel': jlptLevel,
      'name': exerciseName,
      'storagePath': storagePath,
      'exercises': lstExercises.map((quest) => {
            'question': quest.questionWidget.controller.text,
            'audioUrl': quest.audioUrl ?? "",
            'audioPath': quest.audioPath ?? "",
            'imageUrl': quest.imageUrl ?? "",
            'imagePath': quest.imagePath ?? "",
            'answers': quest.answerWidget.lstAnswer.map((quest) => {
                  'answer': quest.field.controller.text,
                  'isTrue': quest.checkField.isChecked,
                }),
          }),
      'vocabularies': vocabularies,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      await _database
          .child('ListeningTest')
          .push()
          .set(newData)
          .catchError((onError) {
        print('could not saved data');
        throw ("aldaa garlaa");
      });
    } else {
      var _todoQuery = _database.child("/ListeningTest");
      await _todoQuery.child("/$key").set(newData).catchError((onError) {
        print('could not update data');
        throw ("aldaa garlaa");
      });
    }
  }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
