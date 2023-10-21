import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/feature/history/widget/history_list_item_widget.dart';
import 'package:chronometer_app/feature/timer/timer_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıtlarım"),
        actions: [
          IconButton(
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
          ),
          // go timer screen
          IconButton(
            icon: const Icon(Icons.timer),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: REdgeInsets.all(20),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return const HistoryListItemWidget();
          },
        ),
      ),
    );
  }
}
