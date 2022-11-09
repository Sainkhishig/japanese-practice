import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/grammar/list/grammar_state.dart';

import 'kanji_state.dart';

final kanjiListController =
    StateNotifierProvider<KanjiListController, KanjiState>(
        (ref) => KanjiListController(ref: ref));

class KanjiListController extends StateNotifier<KanjiState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  KanjiListController({required this.ref}) : super(const KanjiState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================

  setDetailData(dynamic currentExercise) async {
    state = state.copyWith(selectedExerciseData: currentExercise);
  }

  clearData() async {
    state = const KanjiState();
  }
  //#endregion ==================== method ====================
}
