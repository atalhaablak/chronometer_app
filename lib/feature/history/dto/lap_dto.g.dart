// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lap_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LapDto _$LapDtoFromJson(Map<String, dynamic> json) => LapDto(
      lapNumber: json['lapNumber'] as String? ?? '',
      lapDuration: json['lapDuration'] as String? ?? '',
    );

Map<String, dynamic> _$LapDtoToJson(LapDto instance) => <String, dynamic>{
      'lapNumber': instance.lapNumber,
      'lapDuration': instance.lapDuration,
    };
