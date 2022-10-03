import 'package:flutter/material.dart';

class AppDimensions
{
  static const double standardPadding = 16;
  static const double smallPadding = 8;
  static const double standardVerticalSpace = 10;
  static const double standardButtonSpace = 20;
  static const double contentBorderRadius = 50;
  static const double buttonBorderRadius = 50;
  static const double inputBorderRadius = 50;
}

class AppFonts
{
  static const String appFontRegular = 'AppFontRegular';
  static const String appFontBold = 'AppFontBold';
}

class AppColors
{
  //General
  static const Color colorSuccess = Color(0xFF27A744);
  static const Color colorError = Color(0xFFDD3444);
  static const Color colorWarning = Color(0xFFF0952A);
  static const Color colorInfo = Color(0xFF16A3B8);
  static const Color colorHintOnWhite = Color(0xFF78849E);

  static const Color appBlue = Color(0xFF0A4B79);
  static const Color appBlueLight = Color(0xFF3E90CA);

  static const MaterialColor appBlueMaterial = MaterialColor(0xFF0A4B79, {
    50: appBlue,
    100: appBlue,
    200: appBlue,
    300: appBlue,
    400: appBlue,
    500: appBlue,
    600: appBlue,
    700: appBlue,
    800: appBlue,
    900: appBlue,
  });
}

extension ColorExt on Color {
  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}