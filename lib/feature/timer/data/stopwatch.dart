import 'package:chronometer_app/core/utils/remote_data_source/https/domain/repo/base_model_repository.dart';
import 'package:chronometer_app/feature/history/dto/lap_dto.dart';

class StopWatch extends BaseModelRepo<StopWatch> {
  StopWatch.createEmptyStopWatch() : super.init();

  late String? accountId;
  late String? name;
  late int? totalDuration;
  late int? lapCount;
  late DateTime? date;
  late List<LapDto>? lapList;

  StopWatch.createStopWatch({
    required String this.accountId,
    required String this.name,
    required int this.totalDuration,
    this.date,
    this.lapCount,
    this.lapList,
  }) : super.init();

  StopWatch.createStopWatchFromCollection(Map<String, dynamic> map) : super.initFromCollection(incomingMap: map) {
    accountId = map['accountId'];
    name = map['name'];
    totalDuration = map['totalDuration'] as int;
    date = map['date'] != null ? DateTime.parse(map['date']) : null;
    lapCount = map['lapCount'];
    lapList = map["lapList"] != null ? List<LapDto>.from(map["lapList"]?.map((x) => LapDto.createLapDtoFromCollection(x))) : [];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map['accountId'] = accountId;
    map['name'] = name;
    map['totalDuration'] = totalDuration;
    map['date'] = date?.toIso8601String();
    map['lapCount'] = lapCount;
    map['lapList'] = lapList?.map((x) => x.toMap()).toList();
    return map;
  }

  @override
  StopWatch fromMap(Map<String, dynamic> map, {List<String>? innerDocIds}) {
    return StopWatch.createStopWatchFromCollection(map);
  }
}
