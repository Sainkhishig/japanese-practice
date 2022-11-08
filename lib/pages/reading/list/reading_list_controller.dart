import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'reading_state.dart';

final readingListController =
    StateNotifierProvider<ReadingListController, ReadingState>(
        (ref) => ReadingListController(ref: ref));

class ReadingListController extends StateNotifier<ReadingState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  ReadingListController({required this.ref}) : super(const ReadingState());
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
