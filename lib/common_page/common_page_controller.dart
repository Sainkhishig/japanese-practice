import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'common_model.dart';

final commonPageProvider =
    StateNotifierProvider<CommonPageController, CommonPageModel>((ref) {
  return CommonPageController(widgetRef: ref);
});

class CommonPageController extends StateNotifier<CommonPageModel> {
  CommonPageController({required this.widgetRef})
      : super(const CommonPageModel());

  final StateNotifierProviderRef widgetRef;
  @override
  CommonPageModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(commonPageProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedIndex: index);
  }
setMasterDataDestination(String masterDest) async {
    state = state.copyWith(masterDataDestination: masterDest);
  }
  setGameMode(bool isGameMode) async {
    state = state.copyWith(isGameMode: isGameMode);
  }
}
