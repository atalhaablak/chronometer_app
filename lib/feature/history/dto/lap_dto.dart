import 'package:json_annotation/json_annotation.dart';

part 'lap_dto.g.dart';

@JsonSerializable()
class LapDto {
  @JsonKey(defaultValue: "")
  final String? lapNumber;
  @JsonKey(defaultValue: "")
  final String? lapDuration;

  LapDto({required this.lapNumber, required this.lapDuration});

  factory LapDto.fromJson(Map<String, dynamic> json) => _$LapDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LapDtoToJson(this);
}
