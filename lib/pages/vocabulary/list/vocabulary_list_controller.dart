import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'vocabulary_state.dart';

final vocabularyListController =
    StateNotifierProvider<VocabularyListController, VocabularyState>(
        (ref) => VocabularyListController(ref: ref));

class VocabularyListController extends StateNotifier<VocabularyState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  VocabularyListController({required this.ref})
      : super(const VocabularyState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================

  setDetailData(dynamic currentExercise) async {
    state = state.copyWith(selectedExerciseData: currentExercise);
  }

  clearData() async {
    state = const VocabularyState();
  }
  //#endregion ==================== method ====================
}
