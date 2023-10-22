import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_view_model.dart';
import 'package:chronometer_app/feature/history/widget/history_list_item_widget.dart';
import 'package:chronometer_app/feature/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıtlarım"),
        actions: [
          _buildAppBarActions(context),
          IconButton(
            icon: const Icon(Icons.timer),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
            },
          ),
        ],
      ),
      body: ChangeNotifierProvider<HistoryViewmodel>(
        create: (context) => HistoryViewmodel(),
        builder: (context, widget) {
          return Consumer<HistoryViewmodel>(
            builder: (context, viewmodel, widget) {
              return Padding(
                padding: REdgeInsets.all(20),
                child: viewmodel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20.h);
                        },
                        itemCount: viewmodel.historyList.length,
                        itemBuilder: (context, index) {
                          return HistoryListItemWidget(historyListItem: viewmodel.historyList[index]);
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }

  IconButton _buildAppBarActions(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_outline_outlined),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Tümünü Sil"),
              content: const Text("Tüm kayıtları silmek istediğinize emin misiniz?"),
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
}
