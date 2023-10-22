extension DurationExtensions on Duration {
  String get getDurationInHHMMSS {
    return '$getDurationInHour:$getDurationInMinute:$getDurationInSecond';
  }

  String get getDurationInHour {
    return inHours.toString().padLeft(2, '0');
  }

  String get getDurationInMinute {
    return (inMinutes % 60).toString().padLeft(2, '0');
  }

  String get getDurationInSecond {
    return (inSeconds % 60).toString().padLeft(2, '0');
  }
}
