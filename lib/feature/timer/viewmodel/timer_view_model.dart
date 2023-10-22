import 'dart:async';

import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/dto/history_detail_dto.dart';
import 'package:chronometer_app/feature/history/dto/lap_dto.dart';
import 'package:chronometer_app/feature/timer/widget/save_dialog.dart';
import 'package:flutter/material.dart';

class TimerViewModel extends BaseViewModel {
  TimerViewModel() {}

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

  void onTappedResetOrAddLapButton(bool isPlayingTime) {
    if (isPlayingTime) {
      addLap();
    } else {
      resetTimer();
    }
  }

  void addLap() {
    lapCount++;
    final lap = LapDto(
      lapNumber: "$lapCount", // TODO: doğru sıralamayı alacak yapıyı kur
      lapDuration: duration.toString(),
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

  void saveTime() {
    HistoryDetailDto historyDetailDto = HistoryDetailDto(
      name: nameController.text,
      totalCount: lapCount,
      totalDuration: duration.toString(),
      lapList: lapList,
    );
    if (isActiveSaveNameButton) {
      // TODO: FireBase Kayıt işlemi yapılacak
    }
  }

  void nameControllerChanged(String? value) {
    nameController.text = value.getValueOrDefault;
    isActiveSaveNameButton = nameController.text.isNotEmpty;
    refreshView();
  }
}
