// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GrammarState _$$_GrammarStateFromJson(Map<String, dynamic> json) =>
    _$_GrammarState(
      lstGrammar: json['lstGrammar'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      selectedExerciseData: json['selectedExerciseData'] ?? null,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_GrammarStateToJson(_$_GrammarState instance) =>
    <String, dynamic>{
      'lstGrammar': instance.lstGrammar,
      'selectedCardIndex': instance.selectedCardIndex,
      'selectedExerciseData': instance.selectedExerciseData,
      'jlptLevel': instance.jlptLevel,
    };
