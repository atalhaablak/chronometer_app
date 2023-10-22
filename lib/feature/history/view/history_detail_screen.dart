import 'package:chronometer_app/core/extensions/int_extension.dart';
import 'package:chronometer_app/core/extensions/list_extension.dart';
import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/extensions/string_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/feature/history/dto/history_detail_dto.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryDetailScreen extends StatelessWidget {
  final int historyItemId;
  const HistoryDetailScreen({super.key, required this.historyItemId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryDetailViewModel(historyItemId: historyItemId),
      builder: (context, child) {
        return Consumer<HistoryDetailViewModel>(
          builder: (context, viewModel, child) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Detay", style: context.px24w400.copyWith(color: Colors.white)),
                actions: [
                  _buildDeleteButton(context),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (viewModel.historyDetailDto?.name).getValueOrDefault,
                              style: context.px24w400,
                            ),
                            SizedBox(height: 20.h),
                            _buildHistoryDetail(context, viewModel.historyDetailDto),
                          ],
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_outline_outlined),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Kaydı Sil"),
              content: const Text("Kaydı silmek istediğinize emin misiniz?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("İptal"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Sil"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildHistoryDetail(BuildContext context, HistoryDetailDto? historyDetailDto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Toplam Süre",
          style: context.px16w400,
        ),
        SizedBox(height: 5.h),
        Text(
          (historyDetailDto?.totalDuration).getValueOrDefault,
          style: context.px16w600,
        ),
        SizedBox(height: 20.h),
        Text(
          "Tur Sayısı",
          style: context.px16w400,
        ),
        SizedBox(height: 5.h),
        Text(
          ((historyDetailDto?.totalCount).getValueOrDefault).toString(),
          style: context.px16w600,
        ),
        SizedBox(height: 20.h),
        Text(
          "Turlar",
          style: context.px16w600,
        ),
        SizedBox(height: 5.h),
        (historyDetailDto?.lapList).isNullOrEmpty
            ? const Text("Bu kayıtta tur bulunmamaktadır.")
            : ListView.separated(
                itemCount: (historyDetailDto?.lapList).getValueOrDefault.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) => Text(
                  "#$index - ${(historyDetailDto?.lapList).getValueOrDefault[index].lapDuration}",
                  style: context.px16w400,
                ),
              ),
      ],
    );
  }
}
