import 'package:json_annotation/json_annotation.dart';

part 'history_list_model.g.dart';

@JsonSerializable()
class HistoryListDto {
  final int id;
  @JsonKey(defaultValue: "")
  final String? name;
  @JsonKey(defaultValue: "")
  final String? totalDuration;
  @JsonKey(defaultValue: "")
  final String? lapCount;
  @JsonKey(defaultValue: "")
  final String? date;

  HistoryListDto({required this.id, this.name, this.totalDuration, this.lapCount, this.date});

  factory HistoryListDto.fromJson(Map<String, dynamic> json) => _$HistoryListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryListDtoToJson(this);
}
