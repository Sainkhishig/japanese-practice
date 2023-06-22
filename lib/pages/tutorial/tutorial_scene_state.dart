import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_scene_state.freezed.dart';
part 'tutorial_scene_state.g.dart';

@freezed
abstract class TutorialSceneState with _$TutorialSceneState {
  const factory TutorialSceneState({
    @Default([]) List<dynamic> lstTutorialMenu,
    @Default({}) Map lstAllTutorial,
    @Default(1) int selectedCardIndex,
    @Default("") String selectedTutorialKey,
    @Default(null) dynamic selectedTutorial,
  }) = _TutorialSceneState;
  factory TutorialSceneState.fromJson(Map<String, dynamic> json) =>
      _$TutorialSceneStateFromJson(json);
}
