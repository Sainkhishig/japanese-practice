// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommonPageModel _$$_CommonPageModelFromJson(Map<String, dynamic> json) =>
    _$_CommonPageModel(
      title: json['title'] as String? ?? '',
      selectedIndex: json['selectedIndex'] as int? ?? 0,
      isGameMode: json['isGameMode'] as bool? ?? false,
      masterDataDestination:
          json['masterDataDestination'] as String? ?? 'masterDate',
    );

Map<String, dynamic> _$$_CommonPageModelToJson(_$_CommonPageModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selectedIndex': instance.selectedIndex,
      'isGameMode': instance.isGameMode,
      'masterDataDestination': instance.masterDataDestination,
    };
