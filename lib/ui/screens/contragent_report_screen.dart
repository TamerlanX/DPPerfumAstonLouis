import 'package:dp_perfum/ui/report_ui_controller.dart';
import 'package:dp_perfum/ui/widgets/contragent_report_list.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/date_range.dart';

class ContragentReportScreen extends StatelessWidget {

  final _controller = ReportUiController();
  ContragentReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Borc hesabatı', body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DateRange(startDate: _controller.startDate, endDate: _controller.endDate, onDateChange: (dt1, dt2) {
          _controller.startDate = dt1!;
          _controller.endDate = dt2!;
        }),
        const SizedBox(height: 5),
        Expanded(child: ContragentReportList(controller: _controller))
      ],
    ));
  }
}
