import 'package:dp_perfum/infrastructure/local_settings.dart';
import 'package:dp_perfum/services/account_service.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/widgets/app_logo.dart';
import 'package:dp_perfum/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);
  static var _checked = false;

  static clearState() {
    _checked = false;
  }

  _checkLogin() async {

    if (_checked) return;
    _checked = true;

    var ss = await LocalSettings.getSettings();

    if (StringUtils.isEmpty(ss.userName) || StringUtils.isEmpty(ss.password)) {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(() => LoginScreen());
      return;
    }

    await AccountService().login(ss.userName!, ss.password!).then((value) {
      Get.offAll(() => const MainScreen());
    }).catchError((e) {
      Get.offAll(() => LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkLogin());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.appBlueLight, AppColors.appBlue])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Expanded(child: Center(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: AppLogo(),
            ))),
            SafeArea(child: Text('Version 1.0.0', textAlign: TextAlign.center, style: TextStyle(
                color: AppColors.colorHintOnWhite
            )))
          ],
        ),
      ),
    );
  }
}
