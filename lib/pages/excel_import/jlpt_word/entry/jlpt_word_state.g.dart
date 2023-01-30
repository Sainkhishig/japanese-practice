// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jlpt_word_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JlptWordState _$$_JlptWordStateFromJson(Map<String, dynamic> json) =>
    _$_JlptWordState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
      selectedExerciseData: json['selectedExerciseData'] ?? null,
    );

Map<String, dynamic> _$$_JlptWordStateToJson(_$_JlptWordState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
      'selectedExerciseData': instance.selectedExerciseData,
    };
