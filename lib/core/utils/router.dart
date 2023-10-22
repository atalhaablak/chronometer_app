import 'package:chronometer_app/core/utils/route.dart';
import 'package:chronometer_app/feature/auth/login/log_in_screen.dart';
import 'package:chronometer_app/feature/auth/register/sign_up_screen.dart';
import 'package:chronometer_app/feature/history/view/history_detail_screen.dart';
import 'package:chronometer_app/feature/history/view/history_screen.dart';
import 'package:chronometer_app/feature/timer/timer_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case logInPageRoute:
      return MaterialPageRoute(builder: (_) => const LogInScreen());
    case signUpPageRoute:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case historyPageRoute:
      return MaterialPageRoute(builder: (_) => const HistoryScreen());
    case historyDetailPageRoute:
      String historyItemId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => HistoryDetailScreen(historyItemId: historyItemId));
    case timerPageRoute:
      return MaterialPageRoute(builder: (_) => const TimerScreen());
    default:
      return MaterialPageRoute(builder: (_) => const LogInScreen());
  }
}
