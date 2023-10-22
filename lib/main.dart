import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_view_model.dart';
import 'package:chronometer_app/feature/splash/splash_screen.dart';
import 'package:chronometer_app/feature/timer/viewmodel/timer_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/utils/router.dart' as router;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  await Firebase.initializeApp(
      // name: "chronometerApp",
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HistoryViewmodel>(create: (context) => getIt()),
        ChangeNotifierProvider<TimerViewModel>(create: (context) => TimerViewModel()),
      ],
      child: const ChronometerApp(),
    ),
  );
}

class ChronometerApp extends StatelessWidget {
  const ChronometerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
      return MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        onGenerateRoute: router.generateRoute,
        navigatorKey: GlobalContextKey.instance.globalKey,
        title: 'Material App',
        home: const SplashScreen(),
      );
    });
  }
}
