// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jlpt_word_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JlptWordListState _$$_JlptWordListStateFromJson(Map<String, dynamic> json) =>
    _$_JlptWordListState(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      selectedRowData: json['selectedRowData'] ?? null,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_JlptWordListStateToJson(
        _$_JlptWordListState instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'selectedRowData': instance.selectedRowData,
      'jlptLevel': instance.jlptLevel,
    };
