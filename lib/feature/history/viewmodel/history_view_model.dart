import 'package:chronometer_app/core/viewmodel/base_view_model.dart';
import 'package:chronometer_app/feature/history/dto/history_list_model.dart';

class HistoryViewmodel extends BaseViewModel {
  HistoryViewmodel() {
    _getHistory();
  }

  List<HistoryListDto> historyList = [];

  Future<void> _getHistory() async {
    // TODO: Get history from FireBase

    isLoading = true;

    historyList = [
      HistoryListDto(id: 1, name: 'Sabah Koşusu', totalDuration: '01:30:24', lapCount: '3', date: '12/12/2020'),
      HistoryListDto(id: 2, name: 'Öğlen Koşusu', totalDuration: '01:31:57', lapCount: '4', date: '12/12/2021'),
      HistoryListDto(id: 3, name: 'Akşam Koşusu', totalDuration: '00:30:00', lapCount: '2'),
    ];

    await Future.delayed(const Duration(seconds: 1)); // TODO: Kaldırılacak

    isLoading = false;
    refreshView();
  }
}
