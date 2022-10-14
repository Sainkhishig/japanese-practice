// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadingState _$$_ReadingStateFromJson(Map<String, dynamic> json) =>
    _$_ReadingState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_ReadingStateToJson(_$_ReadingState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
    };
