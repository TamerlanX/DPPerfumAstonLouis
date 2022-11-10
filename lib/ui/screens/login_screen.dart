import 'package:dp_perfum/infrastructure/local_settings.dart';
import 'package:dp_perfum/services/account_service.dart';
import 'package:dp_perfum/ui/core/ui_helper.dart';
import 'package:dp_perfum/ui/widgets/app_logo.dart';
import 'package:dp_perfum/ui/widgets/app_scaffold.dart';
import 'package:dp_perfum/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget with UiHelper {

  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  void _login() async {
    if (StringUtils.isEmpty(_username.text)) {
      showErrorSnack('İstifadəçi adı daxil edin');
      return;
    }

    if (StringUtils.isEmpty(_password.text)) {
      showErrorSnack('Şifrə daxil edin');
      return;
    }

    showLoading();
    await AccountService().login(_username.text, _password.text).then((value) async {
      var ss = await LocalSettings.getSettings();
      ss.userName = _username.text;
      ss.password = _password.text;
      Get.offAll(() => const MainScreen());
    }).whenComplete(() => hideLoading())
        .catchError((e) => showException(e));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'ASTON LOUIS',
        showBack: false,
        subTitle: 'Sistemə giriş',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            const SizedBox(height: 30),

            AppTextField(hint: 'İstifadəçi adı', controller: _username, maxLength: 30),
            const SizedBox(height: 10),

            AppTextField(hint: 'Şifrə', controller: _password, maxLength: 15, isPassword: true),
            const SizedBox(height: 15),

            AppButton(text: 'Daxil ol', onPressed: _login)
          ],
        ));
  }
}
