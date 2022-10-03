import 'package:dp_perfum/ui/screens/general_report_screen.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/ui/widgets/report_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'DP Perfum',
      showBack: false,
      body: GridView.count(
          crossAxisCount: 2,
          children: [
            ReportButton(text: 'Ümumi hesabat', icon: Ionicons.bar_chart_outline, onTap: () => Get.to(() => GeneralReportScreen())),
            ReportButton(text: 'Kassa hesabatı', icon: Ionicons.wallet_outline, onTap: (){}),
            ReportButton(text: 'Satış hesabatı', icon: Ionicons.arrow_up_outline, onTap: (){}),
            ReportButton(text: 'Kontragent hesabatı', icon: Ionicons.people_outline, onTap: (){}),
            ReportButton(text: 'Qalıq hesabatı', icon: Ionicons.pie_chart_outline, onTap: (){}),
          ]));
  }
}
