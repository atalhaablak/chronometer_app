import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/ui/widget/app_button.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              _buildTimer(context),
              SizedBox(height: 20.h),
              _buildTimerButtons(context),
              SizedBox(height: 20.h),
              _buildLapList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimer(BuildContext context) {
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
            "00:00:00",
            style: context.px24w600.copyWith(color: context.white),
          ),
          SizedBox(height: 20.h),
          Text(
            "Tur Sayısı: 0",
            style: context.px16w400.copyWith(color: context.white),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppButton(
            text: "Tur", // Sayarken Tur Durmuşken Sıfırla olacak
            onPressed: () {},
            backgroundColor: context.darkGrey,
            buttonHeight: 40.h,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: AppButton(
            text: "Başlat", // Durdur olacak
            onPressed: () {},
            backgroundColor: context.green, // red olacak
            buttonHeight: 40.h,
          ),
        ),
      ],
    );
  }

  Widget _buildLapList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tur Listesi",
          style: context.px16w400,
        ),
        SizedBox(height: 10.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "Tur ${index + 1}",
                style: context.px16w400,
              ),
              trailing: Text(
                "00:00:00",
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
          itemCount: 10,
        ),
      ],
    );
  }
}
