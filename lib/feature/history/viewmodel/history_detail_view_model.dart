import 'package:chronometer_app/core/error/failure.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/keys/global_key.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/entities/querys.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/repo/base_request_repository.dart';
import 'package:chronometer_app/core/utils/route_manager/route_manager.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';
import 'package:flutter/material.dart';

class HistoryDetailViewModel extends BaseViewModel {
  final String historyItemId;
  HistoryDetailViewModel({required this.historyItemId}) {
    getDetail();
  }

  StopWatch? historyDetailDto;

  Future<void> getDetail() async {
    isLoading = true;

    try {
      var response = await getIt<BaseRequestRepository>().fetch<StopWatch>(querys: [
        Querys.where(
          filteringField: "documentId",
          filterType: WhereType.IS_EQUAL,
          filterValue: historyItemId,
        ),
      ]);
      historyDetailDto = response.fold((l) => null, (r) => r.first);
    } on Failure catch (e) {
      showAboutDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, children: [Text(e.errorMessage.getValueOrDefault)]);
    }

    isLoading = false;
    refreshView();
  }

  Future<void> removeCard(StopWatch historyListItem) async {
    try {
      var response = await getIt<BaseRequestRepository>().delete(deletedData: historyListItem);
      if (response.isRight()) {
        Go.to.maybePop();
      } else {
        throw Exception("Silme işlemi başarısız oldu.");
      }
    } on Failure catch (e) {
      showAboutDialog(context: GlobalContextKey.instance.currentNavigatorKey.currentContext!, children: [Text(e.errorMessage.getValueOrDefault)]);
    }
    refreshView();
  }
}
