import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("{Kayıt İsmi}"),
        actions: [
          IconButton(
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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "{Kayıt İsmi}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              _buildHistoryDetail(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryDetail(BuildContext context) {
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
          "00:00:00",
          style: context.px16w600,
        ),
        SizedBox(height: 20.h),
        Text(
          "Tur Sayısı",
          style: context.px16w400,
        ),
        SizedBox(height: 5.h),
        Text(
          "0",
          style: context.px16w600,
        ),
        SizedBox(height: 20.h),
        Text(
          "Turlar",
          style: context.px16w600,
        ),
        SizedBox(height: 5.h),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) => Text(
            "#${index} {Turlar}",
            style: context.px16w400,
          ),
        ),
      ],
    );
  }
}
