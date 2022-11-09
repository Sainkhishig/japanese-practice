import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'grammar_state.dart';

final grammarListController =
    StateNotifierProvider<GrammarListController, GrammarState>(
        (ref) => GrammarListController(ref: ref));

class GrammarListController extends StateNotifier<GrammarState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  GrammarListController({required this.ref}) : super(const GrammarState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================

  setDetailData(dynamic currentExercise) async {
    state = state.copyWith(selectedExerciseData: currentExercise);
  }

  clearData() async {
    state = GrammarState();
  }

  clearState() => state = const GrammarState();
  // state = state.copyWith(selectedExerciseData: currentExercise);
  //#endregion ==================== method ====================
}
