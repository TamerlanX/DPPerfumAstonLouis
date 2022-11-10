import 'package:dp_perfum/infrastructure/local_settings.dart';
import 'package:dp_perfum/ui/dialogs/confirmation_dialog.dart';
import 'package:dp_perfum/ui/screens/cash_report_screen.dart';
import 'package:dp_perfum/ui/screens/contragent_report_screen.dart';
import 'package:dp_perfum/ui/screens/general_report_screen.dart';
import 'package:dp_perfum/ui/screens/profit_loss_report_screen.dart';
import 'package:dp_perfum/ui/screens/remainder_report_screen.dart';
import 'package:dp_perfum/ui/screens/selling_report_screen.dart';
import 'package:dp_perfum/ui/screens/splash_screen.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/ui/widgets/report_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  void _logout() async {
      var res = await ConfirmationDialog(message: 'Sistemdən çıxmaq istədiyinizdən əminsiniz?', title: 'Xəbərdarlıq').showDialog();
      if (res != DialogResult.yes) return;

      final ss = await LocalSettings.getSettings();
      ss.clearSettings();
      SplashScreen.clearState();
      Get.offAll(() => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'DP Perfum',
      showBack: false,
      actionButton: IconButton(icon: const Icon(Icons.logout), color: Colors.white, onPressed: _logout),
      body: GridView.count(
          crossAxisCount: 2,
          children: [
            ReportButton(text: 'Ümumi hesabat', icon: Ionicons.bar_chart_outline, onTap: () => Get.to(() => GeneralReportScreen())),
            ReportButton(text: 'Kassa hesabatı', icon: Ionicons.wallet_outline, onTap: () => Get.to(() => CashReportScreen())),
            ReportButton(text: 'Satış hesabatı', icon: Ionicons.arrow_up_outline, onTap: () => Get.to(() => SellingReportScreen())),
            ReportButton(text: 'Kontragent hesabatı', icon: Ionicons.people_outline, onTap: () => Get.to(() => ContragentReportScreen())),
            ReportButton(text: 'Qalıq hesabatı', icon: Ionicons.pie_chart_outline, onTap: () => Get.to(() => RemainderReportScreen())),
            ReportButton(text: 'Mənfəət/Zərər', icon: Ionicons.trending_up_outline, onTap: () => Get.to(() => ProfitLossReportScreen())),
          ]));
  }
}
