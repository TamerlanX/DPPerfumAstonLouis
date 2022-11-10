import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ConfirmationDialog {

  final _btnPadding = const EdgeInsets.symmetric(vertical: 0, horizontal: 10);

  final String message;
  final String? title;
  final DialogType dialogType;

  ConfirmationDialog({
    required this.message,
    this.dialogType = DialogType.question,
    this.title
  });

  Color _getColor() {
    switch (dialogType) {
      case DialogType.warning: return AppColors.colorWarning;
      default: return AppColors.appBlue;
    }
  }

  Future<DialogResult> showDialog() async {
    DialogResult? result;

    await Get.dialog(Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.question_mark_outlined, color: _getColor(), size: 40),
                const SizedBox(height: 5),
                if (title != null) Text(title!, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.colorHintOnWhite, fontSize: 15)),
                const SizedBox(height: 25),
                Text(message, textAlign: TextAlign.center, style: TextStyle(
                    color: _getColor(),
                    fontSize: 18
                )),
                const SizedBox(height: 10),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Expanded(
                    child: AppButton(text: 'Xeyr', padding: _btnPadding, style: AppButtonStyle.danger, onPressed: () {
                      result = DialogResult.no;
                      Get.back();
                    }),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppButton(text: 'Bəli', padding: _btnPadding, style: AppButtonStyle.success, onPressed: () {
                      result = DialogResult.yes;
                      Get.back();
                    }),
                  )
                ])
              ],
            ))), barrierColor: Colors.black.withOpacity(0.7), barrierDismissible: false);

    return result ?? DialogResult.no;
  }
}

enum DialogResult {
  yes,
  no
}