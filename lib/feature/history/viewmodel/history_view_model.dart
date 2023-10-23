import 'package:chronometer_app/core/error/failure.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/ui/widget/show_error_dialog.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/_https_exports.dart';
import 'package:chronometer_app/core/utils/route.dart';
import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryViewmodel extends BaseViewModel {
  HistoryViewmodel() {
    getHistory();
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List<StopWatch>? historyList;

  Future<void> getHistory() async {
    isLoading = true;

    try {
      var response = await getIt<BaseRequestRepository>().fetch<StopWatch>(
        querys: [
          Querys.where(
            filteringField: "accountId",
            filterValue: _firebaseAuth.currentUser?.uid.getValueOrDefault,
            filterType: WhereType.IS_EQUAL,
          ),
        ],
      );
      historyList = response.fold((l) => [], (r) => r);
    } on Failure catch (e) {
      showAppErrorDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, content: e.errorMessage);
    }

    isLoading = false;
    refreshView();
  }

  Future<void> removeCard(StopWatch historyListItem) async {
    try {
      var response = await getIt<BaseRequestRepository>().delete(deletedData: historyListItem);
      if (response.isLeft()) {
        throw Exception();
      } else {
        historyList!.remove(historyListItem);
        Go.to.maybePop();
      }
    } on Failure catch (e) {
      showAppErrorDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, content: e.errorMessage);
    }
    refreshView();
  }

  Future<void> removeAllCard() async {
    isLoading = true;
    try {
      historyList?.forEach((element) async {
        var response = await getIt<BaseRequestRepository>().delete(deletedData: element);
        if (response.isLeft()) {
          throw Exception();
        }
      });
      historyList!.clear();
    } on Failure catch (e) {
      showAppErrorDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, content: e.errorMessage);
    }
    isLoading = false;
    refreshView();
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();

    Go.to.pageAndRemoveUntil(
      logInPageRoute,
      predicate: (route) => route.isFirst,
    );
  }

  void naviateToTimerScreen() {
    Go.to.page(timerPageRoute);
  }
}
