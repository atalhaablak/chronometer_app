import 'package:chronometer_app/feature/history/viewmodel/history_detail_view_model.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_view_model.dart';
import 'package:chronometer_app/feature/timer/viewmodel/timer_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  // viewmodels
  getIt.registerLazySingleton<HistoryViewmodel>(() => HistoryViewmodel());
  getIt.registerFactory<HistoryDetailViewModel>(() => HistoryDetailViewModel(historyItemId: getIt()));
  getIt.registerFactory<TimerViewModel>(() => TimerViewModel());

  // services
}
