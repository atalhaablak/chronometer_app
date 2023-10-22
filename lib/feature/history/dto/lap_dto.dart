import 'package:chronometer_app/core/utils/remote_data_source/https/_https_exports.dart';

class LapDto extends BaseModelRepo<LapDto> {
  String? lapNumber;
  int? lapDuration;

  LapDto.createLapDto({
    required String this.lapNumber,
    required int this.lapDuration,
  }) : super.init();

  LapDto.createEmptyLapDto() : super.init();

  LapDto.createLapDtoFromCollection(Map<String, dynamic> map) : super.initFromCollection(incomingMap: map) {
    lapNumber = map['lapNumber'];
    lapDuration = map['lapDuration'];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map['lapNumber'] = lapNumber;
    map['lapDuration'] = lapDuration;
    return map;
  }

  @override
  LapDto fromMap(Map<String, dynamic> map, {List<String>? innerDocIds}) {
    return LapDto.createLapDtoFromCollection(map);
  }
}
