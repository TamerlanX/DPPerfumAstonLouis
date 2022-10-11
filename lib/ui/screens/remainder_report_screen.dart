import 'package:dp_perfum/ui/report_ui_controller.dart';
import 'package:dp_perfum/ui/widgets/remainder_report_list.dart';
import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/date_range.dart';

class RemainderReportScreen extends StatelessWidget {
  final _controller = ReportUiController();
  RemainderReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Qalıq hesabatı', body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DateRange(startDate: _controller.startDate, endDate: _controller.endDate, onDateChange: (dt1, dt2) {
          _controller.startDate = dt1!;
          _controller.endDate = dt2!;
        }),
        const SizedBox(height: 5),
        Expanded(child: RemainderReportList(controller: _controller))
      ],
    ));
  }
}
