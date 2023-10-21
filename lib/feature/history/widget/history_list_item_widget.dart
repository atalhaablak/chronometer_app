import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_styles.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/feature/history/view/history_detail_screen.dart';
import 'package:flutter/material.dart';

class HistoryListItemWidget extends StatelessWidget {
  const HistoryListItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key("key"), // TODO: Key'i düzelt
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return _showConfirmDeleteButton(context);
      },
      background: _buildDeleteView(context),
      onDismissed: (direction) {},
      child: Container(
        width: double.infinity,
        padding: REdgeInsets.all(16),
        decoration: context.boxDecorationRadius10.copyWith(border: Border.all(color: context.lightPurple, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Kayıt İsmi",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "23.04.2024",
                  style: context.px16w400,
                ),
                Text(
                  "00:00:00",
                  style: context.px16w400,
                ),
                Text(
                  "0",
                  style: context.px16w400,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryDetailScreen()));
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: context.lightPurple,
              ),
            ),
          ],
        ),
      ),
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

  Future<bool?> _showConfirmDeleteButton(BuildContext context) {
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
              onPressed: () {
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
