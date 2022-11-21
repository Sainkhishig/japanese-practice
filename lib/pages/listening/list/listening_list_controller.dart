import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'listening_state.dart';

final listeningListController =
    StateNotifierProvider<ListeningListController, ListeningState>(
        (ref) => ListeningListController(ref: ref));

class ListeningListController extends StateNotifier<ListeningState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  ListeningListController({required this.ref}) : super(const ListeningState());
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
