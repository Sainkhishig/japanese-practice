import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/entry/jlpt_word_state.dart';
import 'package:japanese_practise_n5/pages/excel_import/model/JlptWord.dart';

import 'package:shared_preferences/shared_preferences.dart';

final jlptEntryController =
    StateNotifierProvider<JlptWordEntryController, JlptWordState>(
        (ref) => JlptWordEntryController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class JlptWordEntryController extends StateNotifier<JlptWordState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  JlptWordEntryController({required this.ref}) : super(const JlptWordState()) {
    // prefs = ref.read(sharedPreferencesProvider);
  }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  JlptWordState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const JlptWordState();

  //#endregion ---------- facility ----------
  //#region ---------- save ----------
  Future<void> writeNew(String key, JlptWord data) async {
    List<Map<String, dynamic>> lstSendItem = [];

    final storageRef = FirebaseStorage.instance.ref();

    final newData = <String, dynamic>{
      'level': data.kana,
      'kanji': data.kanji,
      'kana': data.kana,
      'pos': data.pos,
      'meaningMn': data.meaningMn,
      'meaningEn': data.meaningEn,
      'example': data.example,
      'exampleMn': data.exampleMn,
      'exampleEn': data.exampleEn,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    if (key.isEmpty) {
      await _database
          .child('JlptWord')
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
