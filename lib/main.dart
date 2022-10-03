import 'package:dp_perfum/ui/screens/main_screen.dart';
import 'package:dp_perfum/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/core/bouncing_scroll_behaviour.dart';
import 'ui/core/ui_values.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        enableLog: false,
        defaultTransition: Transition.rightToLeft,
        theme: ThemeData(
            fontFamily: AppFonts.appFontRegular,
            primarySwatch: AppColors.appBlueMaterial),
        builder: (context, child) => ScrollConfiguration(behavior: BouncingScrollBehaviour(), child: child!),
        home: const MainScreen()
    );
  }
}