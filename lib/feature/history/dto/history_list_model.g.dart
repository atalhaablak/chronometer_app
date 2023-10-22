// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryListDto _$HistoryListDtoFromJson(Map<String, dynamic> json) =>
    HistoryListDto(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      totalDuration: json['totalDuration'] as String? ?? '',
      lapCount: json['lapCount'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$HistoryListDtoToJson(HistoryListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalDuration': instance.totalDuration,
      'lapCount': instance.lapCount,
      'date': instance.date,
    };
