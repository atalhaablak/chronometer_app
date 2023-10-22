import 'package:chronometer_app/core/extensions/list_extension.dart';
import 'package:chronometer_app/core/extensions/num_extension.dart';
import 'package:chronometer_app/core/functions/r_edge_instets.dart';
import 'package:chronometer_app/core/ui/styles/app_colors.dart';
import 'package:chronometer_app/core/ui/styles/app_text_styles.dart';
import 'package:chronometer_app/feature/history/viewmodel/history_view_model.dart';
import 'package:chronometer_app/feature/history/widget/history_list_item_widget.dart';
import 'package:chronometer_app/feature/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryViewmodel>(
        create: (context) => HistoryViewmodel(),
        builder: (context, widget) {
          return Consumer<HistoryViewmodel>(builder: (context, viewmodel, widget) {
            return Scaffold(
              appBar: AppBar(
                  title: const Text("Kayıtlarım"),
                  actions: [
                    _buildAppBarActions(context, viewmodel),
                    IconButton(
                      icon: const Icon(Icons.timer),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
                      },
                    ),
                  ],
                  leading: IconButton(
                    icon: RotatedBox(
                      quarterTurns: 2,
                      child: const Icon(Icons.logout_outlined),
                    ),
                    onPressed: () {
                      viewmodel.logOut();
                    },
                  )),
              body: RefreshIndicator(
                onRefresh: () async {
                  await viewmodel.getHistory();
                },
                child: Padding(
                  padding: REdgeInsets.all(20),
                  child: viewmodel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : viewmodel.historyList.isNullOrEmpty
                          ? _buildNotFoundWidget(context, viewmodel)
                          : ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 20.h);
                              },
                              itemCount: viewmodel.historyList.itemCount,
                              itemBuilder: (context, index) {
                                return HistoryListItemWidget(historyListItem: viewmodel.historyList.getValueOrDefault[index]);
                              },
                            ),
                ),
              ),
            );
          });
        });
  }

  Widget _buildNotFoundWidget(BuildContext context, HistoryViewmodel viewmodel) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Kayıt bulunamadı",
          style: context.px24w600,
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
          },
          child: Text(
            "Şimdi Başla!",
            style: context.px16w400.copyWith(color: context.lightPurple, decoration: TextDecoration.underline),
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () => viewmodel.getHistory(),
          child: Text(
            "Tekrar Dene",
            style: context.px16w400.copyWith(color: context.lightPurple, decoration: TextDecoration.underline),
          ),
        ),
      ],
    ));
  }

  Widget _buildAppBarActions(BuildContext context, HistoryViewmodel viewmodel) {
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
                  onPressed: () async {
                    await viewmodel.removeAllCard();
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
