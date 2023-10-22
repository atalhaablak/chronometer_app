import 'package:chronometer_app/core/extensions/date_time_extension.dart';
import 'package:chronometer_app/core/extensions/int_extension.dart';
import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_styles.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/feature/history/view/history_detail_screen.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_view_model.dart';
import 'package:chronometer_app/feature/timer/data/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryListItemWidget extends StatelessWidget {
  final StopWatch historyListItem;
  const HistoryListItemWidget({
    Key? key, // Doğru key parametresi
    required this.historyListItem,
  }) : super(key: key); // super.key ile geçirilmeli

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewmodel>(
      builder: (context, viewModel, child) {
        return Dismissible(
          key: const Key("key"), // TODO: Key'i düzelt
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) {
            return _showConfirmDeleteButton(context, viewModel);
          },
          background: _buildDeleteView(context),
          child: InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryDetailScreen(historyItemId: historyListItem.documentID))),
            child: Container(
              width: double.infinity,
              padding: REdgeInsets.all(16),
              decoration: context.boxDecorationRadius10.copyWith(border: Border.all(color: context.lightPurple, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          historyListItem.name.getValueOrDefault,
                          style: context.px16w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Toplam Süre",
                          style: context.px16w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Tur Sayısı",
                          style: context.px16w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          historyListItem.date?.getDateTimeInDDMMYYYY ?? "--/--/--",
                          style: context.px16w400,
                        ),
                        Text(
                          historyListItem.totalDuration.getDurationInHHMMSS,
                          style: context.px16w400,
                        ),
                        Text(
                          historyListItem.lapCount.getValueOrDefault.toString(),
                          style: context.px16w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildDeleteView(BuildContext context) {
    return Container(
      width: 70.w,
      padding: REdgeInsets.all(16),
      decoration: context.boxDecorationRadius10.copyWith(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete_outline_outlined,
            color: context.red,
          ),
        ],
      ),
    );
  }

  Future<bool?> _showConfirmDeleteButton(BuildContext context, HistoryViewmodel viewmodel) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Kaydı Sil"),
          content: const Text("Kaydı silmek istediğinize emin misiniz?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () async {
                await viewmodel.removeCard(historyListItem);
                Navigator.pop(context, true);
              },
              child: const Text("Sil"),
            ),
          ],
        );
      },
    );
  }
}
