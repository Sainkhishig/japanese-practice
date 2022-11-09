// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VocabularyState _$$_VocabularyStateFromJson(Map<String, dynamic> json) =>
    _$_VocabularyState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
      selectedExerciseData: json['selectedExerciseData'] ?? null,
    );

Map<String, dynamic> _$$_VocabularyStateToJson(_$_VocabularyState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
      'selectedExerciseData': instance.selectedExerciseData,
    };
