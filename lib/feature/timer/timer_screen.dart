import 'package:chronometer_app/core/extensions/list_extension.dart';
import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:chronometer_app/feature/timer/viewmodel/timer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerViewModel>(
      create: (context) => TimerViewModel(),
      child: Consumer<TimerViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Kronometre"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kronometre",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    _buildTimer(context, viewModel),
                    SizedBox(height: 20.h),
                    _buildTimerButtons(context, viewModel),
                    SizedBox(height: 20.h),
                    _buildLapList(context, viewModel),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimer(BuildContext context, TimerViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.lightPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            viewModel.duration.inSeconds.toString(),
            style: context.px24w600.copyWith(color: context.white),
          ),
          SizedBox(height: 20.h),
          Text(
            "Tur Sayısı: ${viewModel.lapCount}",
            style: context.px16w400.copyWith(color: context.white),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerButtons(BuildContext context, TimerViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppButton(
            text: viewModel.isPlayingTime ? "Tur" : "Sıfırla", // Sayarken Tur Durmuşken Sıfırla olacak
            onPressed: () => viewModel.isPlayingTime ? viewModel.addLap() : viewModel.resetTimer(),
            backgroundColor: context.darkGrey,
            buttonHeight: 40.h,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: AppButton(
            text: viewModel.isPlayingTime ? "Durdur" : "Başlat", // Durdur olacak
            onPressed: () => viewModel.isPlayingTime ? viewModel.stopTimer(context) : viewModel.startTimer(),
            backgroundColor: context.green, // red olacak
            buttonHeight: 40.h,
          ),
        ),
      ],
    );
  }

  Widget _buildLapList(BuildContext context, TimerViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Turlar",
          style: context.px16w400,
        ),
        SizedBox(height: 10.h),
        viewModel.lapList.isNullOrEmpty
            ? const Text("Henüz tur eklenmedi.")
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.lapList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "Tur ${viewModel.lapList[index].lapNumber.getValueOrDefault}",
                      style: context.px16w400,
                    ),
                    trailing: Text(
                      viewModel.lapList[index].lapDuration.getValueOrDefault,
                      style: context.px16w400,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: context.grey,
                    thickness: 1,
                  );
                },
              ),
      ],
    );
  }
}
