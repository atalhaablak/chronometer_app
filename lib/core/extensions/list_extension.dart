import 'package:chronometer_app/feature/timer/data/stopwatch.dart';

extension ListExtension<T> on List<T>? {
  List<T> get getValueOrDefault => this ?? [];
  bool get isNullOrEmpty => this == null || getValueOrDefault.isEmpty;
  bool get isNotEmpty => !isNullOrEmpty;
  int get itemCount => getValueOrDefault.length;

  StopWatch? getFirstStopwatch(List<StopWatch> stopwatches) {
    if (stopwatches.isNotEmpty) {
      return stopwatches.first;
    } else {
      return null;
    }
  }
}
