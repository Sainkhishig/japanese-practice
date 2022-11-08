// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KanjiState _$$_KanjiStateFromJson(Map<String, dynamic> json) =>
    _$_KanjiState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
      selectedExerciseData: json['selectedExerciseData'] ?? null,
    );

Map<String, dynamic> _$$_KanjiStateToJson(_$_KanjiState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
      'selectedExerciseData': instance.selectedExerciseData,
    };
