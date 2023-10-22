extension IntExtension on int? {
  int get getValueOrDefault => this ?? 0;

  String get getDurationInHHMMSS {
    return '$getDurationInHour:$getDurationInMinute:$getDurationInSecond';
  }

  String get getDurationInHour {
    return Duration(seconds: getValueOrDefault).inHours.toString().padLeft(2, '0');
  }

  String get getDurationInMinute {
    return (Duration(seconds: getValueOrDefault).inMinutes % 60).toString().padLeft(2, '0');
  }

  String get getDurationInSecond {
    return (Duration(seconds: getValueOrDefault).inSeconds % 60).toString().padLeft(2, '0');
  }
}
