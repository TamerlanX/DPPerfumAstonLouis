import 'package:dp_perfum/models/cash_report_item.dart';
import 'package:dp_perfum/ui/report_ui_controller.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/ui/widgets/cash_report_list.dart';
import 'package:dp_perfum/ui/widgets/date_range.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CashReportScreen extends StatelessWidget {

  final _controller = ReportUiController();
  CashReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Kassa hesabatı', body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
          DateRange(startDate: _controller.startDate, endDate: _controller.endDate, onDateChange: (dt1, dt2) {
            _controller.startDate = dt1!;
            _controller.endDate = dt2!;
          }),
          const SizedBox(height: 5),
          Expanded(child: CashReportList(controller: _controller))
      ],
    ));
  }
}
