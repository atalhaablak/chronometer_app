import 'package:chronometer_app/core/utils/remote_data_source/https/_https_exports.dart';
import 'package:chronometer_app/feature/auth/login/viewmodel/login_view_model.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_detail_view_model.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_view_model.dart';
import 'package:chronometer_app/feature/splash/viewmodel/splash_view_model.dart';
import 'package:chronometer_app/feature/timer/viewmodel/timer_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  // services
  getIt.registerLazySingleton<BaseRequestRepository>(() => FirebaseMainRequestImpl());

  // viewmodels
  getIt.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  getIt.registerLazySingleton<SplashViewModel>(() => SplashViewModel());
  getIt.registerLazySingleton<HistoryViewmodel>(() => HistoryViewmodel());
  getIt.registerFactory<HistoryDetailViewModel>(() => HistoryDetailViewModel(historyItemId: getIt()));
  getIt.registerLazySingleton<TimerViewModel>(() => TimerViewModel());
}
