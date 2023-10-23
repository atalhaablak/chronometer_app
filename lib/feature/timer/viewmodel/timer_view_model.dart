import 'dart:async';
import 'package:chronometer_app/core/error/failure.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/ui/widget/show_error_dialog.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/_https_exports.dart';
import 'package:chronometer_app/core/utils/route.dart';
import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/dto/lap_dto.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';
import 'package:chronometer_app/feature/timer/widget/save_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimerViewModel extends BaseViewModel {
  TimerViewModel();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Timer? timer;
  int passingTime = 0;

  TextEditingController nameController = TextEditingController();

  List<LapDto> lapList = [];
  int lapCount = 0;
  bool isPlayingTime = false;
  bool isActiveSaveNameButton = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      passingTime++;
      refreshView();
    });
    isPlayingTime = true;
    refreshView();
  }

  void stopTimer(BuildContext context) {
    timer?.cancel();
    isPlayingTime = false;
    SaveDialog.showSaveDialog(context);
    refreshView();
  }

  void createLap() {
    lapCount++;
    final lap = LapDto.createLapDto(
      lapNumber: "$lapCount",
      lapDuration: passingTime,
    );
    lapList.add(lap);
    lapList = lapList.reversed.toList();
    refreshView();
  }

  void resetTimer() {
    timer?.cancel();
    lapList.clear();
    lapCount = 0;
    passingTime = 0;
    isPlayingTime = false;
    refreshView();
  }

  void saveTime(BuildContext context) {
    StopWatch historyDetailDto = StopWatch.createStopWatch(
      accountId: (_firebaseAuth.currentUser?.uid).getValueOrDefault,
      name: nameController.text,
      totalDuration: Duration(seconds: passingTime),
      date: DateTime.now(),
      lapCount: lapCount,
      lapList: lapList,
    );
    if (isActiveSaveNameButton) {
      try {
        var response = getIt<BaseRequestRepository>().post(updatedData: historyDetailDto);
        response.then((value) async {
          if (value.isRight()) {
            resetTimer();
            Go.to.pageAndRemoveUntil(historyPageRoute, predicate: (route) => route.isFirst);
          }
        });
      } on Failure catch (e) {
        showAppErrorDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, content: e.errorMessage);
      }
    }
  }

  void nameControllerChanged(String? value) {
    nameController.text = value.getValueOrDefault;
    isActiveSaveNameButton = nameController.text.isNotEmpty;
    refreshView();
  }
}
