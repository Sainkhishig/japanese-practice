// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GrammarState _$$_GrammarStateFromJson(Map<String, dynamic> json) =>
    _$_GrammarState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
      selectedExerciseData: json['selectedExerciseData'] ?? null,
    );

Map<String, dynamic> _$$_GrammarStateToJson(_$_GrammarState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
      'selectedExerciseData': instance.selectedExerciseData,
    };
