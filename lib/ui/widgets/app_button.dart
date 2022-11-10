import 'package:flutter/material.dart';

import '../core/ui_values.dart';

enum AppButtonStyle
{
  normal,
  success,
  warning,
  danger
}

class AppButton extends StatelessWidget {

  final String text;
  final Function() onPressed;
  final double borderRadius;
  EdgeInsets padding;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final AppButtonStyle style;

  AppButton({
    required this.text,
    required this.onPressed,
    this.borderRadius = AppDimensions.buttonBorderRadius,
    this.padding = const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.style = AppButtonStyle.normal});

  Widget _getChild(Color textColor) {
    var txt = Text(
        text, textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontFamily: AppFonts.appFontBold));

    if (prefix != null) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (prefix != null) prefix!,
        const SizedBox(width: 10),
        txt
      ]);
    } else if (suffix != null) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            txt,
            if(suffix != null) suffix!
          ]);
    } else if (prefixIcon != null) {
      padding = EdgeInsets.symmetric(horizontal: padding.horizontal / 2, vertical: padding.vertical / 2 - 8);
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(prefixIcon, color: textColor, size: 20),
            const SizedBox(width: 10),
            txt
          ]);
    }

    else if (suffixIcon != null) {
      padding = EdgeInsets.symmetric(horizontal: padding.horizontal / 2, vertical: padding.vertical / 2 - 8);
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Text('')),
            txt,
            const Expanded(child: Text('')),
            Icon(suffixIcon, color: textColor, size: 27)
          ]);
    }

    return txt;
  }

  @override
  Widget build(BuildContext context) {

    Color textColor = Colors.white;
    Color backColor = Colors.blue;

    switch (style) {
      case AppButtonStyle.success:
        backColor = AppColors.colorSuccess;
        break;
      case AppButtonStyle.warning:
        backColor = AppColors.colorWarning;
        break;
      case AppButtonStyle.danger:
        backColor = AppColors.colorError;
        break;
      case AppButtonStyle.normal:
        backColor = AppColors.appBlue;
        textColor = Colors.white;
        break;
    }

    var child =  _getChild(textColor);

    var btn = ElevatedButton(
        onPressed: () {
          onPressed.call();
        },
        style: ElevatedButton.styleFrom(padding: padding,
            primary: backColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
        child: child
    );

    return ButtonTheme(
        height: 50,
        child: btn
    );
  }
}