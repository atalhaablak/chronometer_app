import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/_https_exports.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/splash/splash_screen.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    } on Exception catch (e) {
      print(e);
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
      }
    } catch (e) {
      print(e);
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
    } catch (e) {
      print(e);
    }
    isLoading = false;
    refreshView();
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();

    Navigator.pushAndRemoveUntil(
      GlobalContextKey.instance.currentNavigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
      (route) => route.isFirst,
    );
  }
}
