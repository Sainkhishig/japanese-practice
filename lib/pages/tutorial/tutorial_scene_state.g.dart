// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_scene_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TutorialSceneState _$$_TutorialSceneStateFromJson(
        Map<String, dynamic> json) =>
    _$_TutorialSceneState(
      lstTutorialMenu: json['lstTutorialMenu'] as List<dynamic>? ?? [],
      lstAllTutorial: json['lstAllTutorial'] as Map<String, dynamic>? ?? {},
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      selectedTutorialKey: json['selectedTutorialKey'] as String? ?? '',
      selectedTutorial: json['selectedTutorial'] ?? null,
    );

Map<String, dynamic> _$$_TutorialSceneStateToJson(
        _$_TutorialSceneState instance) =>
    <String, dynamic>{
      'lstTutorialMenu': instance.lstTutorialMenu,
      'lstAllTutorial': instance.lstAllTutorial,
      'selectedCardIndex': instance.selectedCardIndex,
      'selectedTutorialKey': instance.selectedTutorialKey,
      'selectedTutorial': instance.selectedTutorial,
    };
