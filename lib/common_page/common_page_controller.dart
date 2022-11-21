import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common_providers/shared_preferences_provider.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common_model.dart';

final commonPageProvider =
    StateNotifierProvider<CommonPageController, CommonPageModel>((ref) {
  return CommonPageController(widgetRef: ref);
});

class CommonPageController extends StateNotifier<CommonPageModel> {
  CommonPageController({required this.widgetRef})
      : super(const CommonPageModel());

  final StateNotifierProviderRef widgetRef;
  late SharedPreferences prefs;
  int get jlptLevel => prefs.getInt("jlptLevel") ?? 5;
  @override
  CommonPageModel get state;
  void setModelListenable(WidgetRef ref) {
    prefs = widgetRef.read(sharedPreferencesProvider);
    ref.watch(commonPageProvider);
  }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setJlptLevel(int level) async {
    await prefs.setInt("jlptLevel", level);
    state = state;
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
