// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListeningModel _$$_ListeningModelFromJson(Map<String, dynamic> json) =>
    _$_ListeningModel(
      lstListeningData: json['lstListeningData'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_ListeningModelToJson(_$_ListeningModel instance) =>
    <String, dynamic>{
      'lstListeningData': instance.lstListeningData,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
    };
