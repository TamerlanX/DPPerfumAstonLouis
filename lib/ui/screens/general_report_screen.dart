import 'package:dp_perfum/controllers/general_report_controller.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/ui/widgets/empty_box.dart';
import 'package:dp_perfum/ui/widgets/loading_ring.dart';
import 'package:dp_perfum/ui/widgets/report_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralReportScreen extends StatelessWidget {

  final _controller = GeneralReportController();
  GeneralReportScreen({Key? key}) : super(key: key);
  
  Widget _getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(title, style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20
      )),
    );
  }

  Widget _getCash() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: _controller.report!.cashReport.items.map((e) => ReportLabel(
          title: e.itemName,
          values: {
            'İlkin qalıq': e.initialAmount.toStringAsFixed(2),
            'Mədaxil': e.income.toStringAsFixed(2),
            'Məxaric': e.expense.toStringAsFixed(2),
            'Son qalıq': e.finalAmount.toStringAsFixed(2)
          })).toList()
    );
  }

  Widget _getContragent() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _controller.report!.contragentReport.items.map((e) => ReportLabel(
            title: e.contragentName,
            values: {
              'İlkin borc': e.initialDebt.toStringAsFixed(2),
              'Artma': e.increasedDebt.toStringAsFixed(2),
              'Azalma': e.decreasedDebt.toStringAsFixed(2),
              'Son borc': e.finalDebt.toStringAsFixed(2)
            })).toList()
    );
  }

  Widget _getSelling() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _controller.report!.sellingReport.items.map((e) => ReportLabel(
            title: e.itemName,
            values: {
              'Miqdar': e.quantity.toStringAsFixed(2),
              'Dövriyyə': e.cashFlow.toStringAsFixed(2),
              'Mənfəət': e.profit.toStringAsFixed(2),
            })).toList()
    );
  }

  Widget _getRemainder() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _controller.report!.remainderReport.items.map((e) => ReportLabel(
            title: e.itemName,
            values: {
              'Miqdar': e.quantity.toStringAsFixed(2),
              'Maya': e.cost.toStringAsFixed(2),
              'Pərakəndə': e.retail.toStringAsFixed(2),
              'Topdan': e.wholesale.toStringAsFixed(2),
            })).toList()
    );
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.getReport());

    return AppScaffold(title: 'Ümumi hesabat', body: Obx(() {

        if (_controller.inProgress.value) return const LoadingRing();

        if (_controller.report == null) return const EmptyBox();

        return ListView(
          children: [
            _getTitle('Pul vəsaitləri haqda hesabat'),
            _getCash(),
            const SizedBox(height: 20),

            _getTitle('Müştəri borcları'),
            _getContragent(),
            const SizedBox(height: 20),

            _getTitle('Satış hesabatı'),
            _getSelling(),
            const SizedBox(height: 20),

            _getTitle('Qalıq hesabatı'),
            _getRemainder()
          ],
        );
    }));
  }
}
