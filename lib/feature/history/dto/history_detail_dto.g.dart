// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDetailDto _$HistoyDetailDtoFromJson(Map<String, dynamic> json) => HistoryDetailDto(
      name: json['name'] as String? ?? '',
      totalDuration: json['totalDuration'] as String? ?? '',
      totalCount: json['totalCount'] as int? ?? 0,
      lapList: (json['lapList'] as List<dynamic>?)?.map((e) => LapDto.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    );

Map<String, dynamic> _$HistoyDetailDtoToJson(HistoryDetailDto instance) => <String, dynamic>{
      'name': instance.name,
      'totalDuration': instance.totalDuration,
      'totalCount': instance.totalCount,
      'lapList': instance.lapList,
    };
