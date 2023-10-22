import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/utils/route.dart';
import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/auth/login/viewmodel/login_view_model.dart';

class SplashViewModel extends BaseViewModel {
  @override
  Future<void> init() async {
    await _initiateApp();
  }

  Future<void> _initiateApp() async {
    await Future.delayed(const Duration(seconds: 2));
    if (getIt<LoginViewModel>().isUserLogIn) {
      Go.to.pageAndRemoveUntil(historyPageRoute);
    } else {
      Go.to.pageAndRemoveUntil(logInPageRoute);
    }
  }
}
