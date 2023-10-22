import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/dto/history_detail_dto.dart';
import 'package:chronometer_app/feature/history/dto/lap_dto.dart';

class HistoryDetailViewModel extends BaseViewModel {
  final int historyItemId;
  HistoryDetailViewModel({required this.historyItemId}) {
    getDetail();
  }

  HistoryDetailDto? historyDetailDto;

  Future<void> getDetail() async {
    isLoading = true;
    historyDetailDto = HistoryDetailDto(
      name: "Sabah Koşusu",
      totalCount: 3,
      totalDuration: "01:30:24",
      lapList: [
        LapDto(
          lapNumber: "1",
          lapDuration: "00:30:24",
        ),
        LapDto(
          lapNumber: "2",
          lapDuration: "00:30:24",
        ),
        LapDto(
          lapNumber: "3",
          lapDuration: "00:30:24",
        ),
      ],
    );
    await Future.delayed(const Duration(seconds: 1)); // TODO: Kaldırılacak
    isLoading = false;
    refreshView();
  }
}
