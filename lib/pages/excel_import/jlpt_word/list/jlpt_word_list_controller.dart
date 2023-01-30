import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'jlpt_word_list_state.dart';

final jlptWordListController =
    StateNotifierProvider<JlptWordListController, JlptWordListState>(
        (ref) => JlptWordListController(ref: ref));

class JlptWordListController extends StateNotifier<JlptWordListState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  JlptWordListController({required this.ref})
      : super(const JlptWordListState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================

  clearData() async {
    state = const JlptWordListState();
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setDetailData(dynamic currentExercise) async {
    state = state.copyWith(selectedRowData: currentExercise);
  }

  //#endregion ==================== method ====================
}
