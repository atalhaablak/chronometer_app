import 'package:chronometer_app/feature/history/dto/lap_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_detail_dto.g.dart';

@JsonSerializable()
class HistoryDetailDto {
  @JsonKey(defaultValue: "")
  final String? name;
  @JsonKey(defaultValue: "")
  final String? totalDuration;
  @JsonKey(defaultValue: 0)
  final int? totalCount;
  @JsonKey(defaultValue: [])
  final List<LapDto>? lapList;

  HistoryDetailDto({
    this.name,
    this.totalDuration,
    this.totalCount,
    this.lapList,
  });

  factory HistoryDetailDto.fromJson(Map<String, dynamic> json) => _$HistoyDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoyDetailDtoToJson(this);
}
