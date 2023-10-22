import 'package:chronometer_app/core/error/failure.dart';
import 'package:chronometer_app/feature/auth/data/account.dart';
import 'package:chronometer_app/feature/history/dto/lap_dto.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';

enum Collections { stopWatch, lap, account }

extension CollectionExtension on Collections {
  String stateToCollection({List<String>? innerDocIds}) {
    if (_collectionIsSubCollection()) {
      assert(innerDocIds != null, "InnerRoutes in subcollections cannot be empty");
      assert(innerDocIds!.length == _subCollectionLevel());
    }
    return switch (this) {
      Collections.stopWatch => "stopWatch",
      Collections.lap => "lap",
      Collections.account => "accounts",
    };
  }

  static Collections converterClassToCollections<T>() {
    switch (T) {
      case StopWatch:
        return Collections.stopWatch;
      case LapDto:
        return Collections.lap;
      case Account:
        return Collections.account;
      default:
        throw ThisClassDoesNotImplemented();
    }
  }

  getConvertedReferance({List<String>? innerDocIds}) {
    return switch (this) {
      Collections.stopWatch => StopWatch.createEmptyStopWatch().collectionReference,
      Collections.lap => LapDto.createEmptyLapDto().collectionReference,
      Collections.account => Account.init().collectionReference,
    };
  }

  bool _collectionIsSubCollection() {
    switch (this) {
      case Collections.stopWatch:
      case Collections.lap:
      case Collections.account:
        return false;
    }
  }

  int _subCollectionLevel() {
    switch (this) {
      case Collections.stopWatch:
      case Collections.lap:
      case Collections.account:
        return 0;
    }
  }
}
