import 'package:chronometer_app/core/init/locator.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/entities/querys.dart';
import 'package:chronometer_app/core/utils/remote_data_source/https/domain/repo/base_request_repository.dart';
import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';

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
    } catch (e) {
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
      }
    } catch (e) {}
    refreshView();
  }
}
