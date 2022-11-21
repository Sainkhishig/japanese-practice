// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListeningState _$$_ListeningStateFromJson(Map<String, dynamic> json) =>
    _$_ListeningState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      selectedExerciseData: json['selectedExerciseData'] ?? null,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_ListeningStateToJson(_$_ListeningState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'selectedExerciseData': instance.selectedExerciseData,
      'jlptLevel': instance.jlptLevel,
    };
