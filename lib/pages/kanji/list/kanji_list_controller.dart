import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setDetailData(dynamic currentExercise) async {
    state = state.copyWith(selectedExerciseData: currentExercise);
  }

  //#endregion ==================== method ====================
}
