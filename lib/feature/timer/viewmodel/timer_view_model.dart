import 'dart:async';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/_https_exports.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/dto/lap_dto.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';
import 'package:chronometer_app/feature/timer/widget/save_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimerViewModel extends BaseViewModel {
  TimerViewModel() {}

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Duration duration = Duration();
  Timer? timer;

  TextEditingController nameController = TextEditingController();

  List<LapDto> lapList = [];
  int lapCount = 0;
  bool isPlayingTime = false;
  bool isActiveSaveNameButton = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
    isPlayingTime = true;
    refreshView();
  }

  void addTime() {
    const addSeconds = 1;
    final seconds = Duration(seconds: duration.inSeconds + addSeconds);
    duration = Duration(seconds: seconds.inSeconds);
    refreshView();
  }

  void stopTimer(BuildContext context) {
    timer?.cancel();
    isPlayingTime = false;
    SaveDialog.showSaveDialog(context);
    refreshView();
  }

  void addLap() {
    lapCount++;
    final lap = LapDto.createLapDto(
      lapNumber: "$lapCount",
      lapDuration: duration.inSeconds,
    );
    lapList.add(lap);
    lapList = lapList.reversed.toList();
    refreshView();
  }

  void resetTimer() {
    timer?.cancel();
    lapList.clear();
    lapCount = 0;
    isPlayingTime = false;
    duration = Duration();
    refreshView();
  }

  void saveTime(BuildContext context) {
    StopWatch historyDetailDto = StopWatch.createStopWatch(
      accountId: (_firebaseAuth.currentUser?.uid).getValueOrDefault,
      name: nameController.text,
      totalDuration: duration.inMilliseconds,
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
            Navigator.pop(context);
          }
        });
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  void nameControllerChanged(String? value) {
    nameController.text = value.getValueOrDefault;
    isActiveSaveNameButton = nameController.text.isNotEmpty;
    refreshView();
  }
}
