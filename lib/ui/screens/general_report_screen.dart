import 'package:dp_perfum/controllers/general_report_controller.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/ui/widgets/empty_box.dart';
import 'package:dp_perfum/ui/widgets/loading_ring.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralReportScreen extends StatelessWidget {

  final _controller = GeneralReportController();
  GeneralReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.getReport());

    return AppScaffold(title: 'Ümumi hesabat', body: Obx(() {

        if (_controller.inProgress.value) return const LoadingRing();

        if (_controller.report == null) return const EmptyBox();

        return ListView(
          children: [
            Text(_controller.report!.cashReport.items.first.itemName)
          ],
        );
    }));
  }
}
