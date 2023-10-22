import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/core/utils/screen_size.dart';
import 'package:chronometer_app/feature/splash/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SplashViewModel>(
      create: (context) => SplashViewModel(),
      child: Scaffold(
        body: Consumer<SplashViewModel>(builder: (context, viewModel, child) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.lightPurple,
                  context.deepPurple,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer, size: 100, color: context.white),
                Text(
                  "Chronometer App",
                  style: context.px24w600.copyWith(color: context.white),
                ),
                SizedBox(height: 20.h),
                viewModel.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
