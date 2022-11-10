import 'package:dp_perfum/controllers/profit_loss_report_controller.dart';
import 'package:dp_perfum/models/profit_loss_report.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/ui/widgets/empty_box.dart';
import 'package:dp_perfum/ui/widgets/group_caption.dart';
import 'package:dp_perfum/ui/widgets/loading_ring.dart';
import 'package:dp_perfum/ui/widgets/month_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitLossReportScreen extends StatelessWidget {

  final _controller = ProfitLossReportController();
  ProfitLossReportScreen({Key? key}) : super(key: key);

  Widget _buildSegment(String title, ProfitLossReportGroup segment, { required Color color }) {
    List<Widget> items = [ GroupCaption(text: title)];

    for (var element in segment.items) {
      items.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(element.itemName)),
            const SizedBox(width: 10),
            Text('${element.amount.toStringAsFixed(2)}₼', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 16
            ))
          ],
        ),
      ));

      items.add(Divider(color: Colors.grey.withOpacity(0.3), thickness: 1, height: 1));
    }

    items.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Cəm:', style: TextStyle(
            fontSize: 18,
            color: AppColors.colorHintOnWhite
          )),
          const SizedBox(width: 10),
          Text('${segment.totalAmount.toStringAsFixed(2)}₼', style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.appBlue
          )),
        ],
      ),
    ));

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5
              )
            ]
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items
        )
    );
  }

  Widget _getBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Mənfəət/Zərər:', style: TextStyle(
              fontSize: 18,
              color: AppColors.colorHintOnWhite
          )),
          const SizedBox(width: 10),
          Text('${_controller.report!.profitLossRatio.toStringAsFixed(2)}₼', style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.appBlue
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.getReport(date: DateTime.now()));

    return AppScaffold(
        title: 'Mənfəət/Zərər',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MonthSelector(onChanged: (date) => _controller.getReport(date: date)),
            Expanded(
              child: Obx(() {

                if (_controller.inProgress.value) return const LoadingRing();

                if (_controller.report == null) return const EmptyBox();

                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        children: [
                          _buildSegment('Gəlir', _controller.report!.incomeStats, color: AppColors.colorSuccess),
                          _buildSegment('Xərc', _controller.report!.expanseStats, color: AppColors.colorError),
                        ],
                      ),
                    ),
                    _getBottom(),
                    const SizedBox(height: 15)
                  ],
                );
              }),
            )
          ],
        ));
  }
}
