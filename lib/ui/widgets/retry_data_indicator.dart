import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RetryDataIndicator extends StatelessWidget {

  final PagingController controller;
  const RetryDataIndicator(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        const Text('Şəbəkə xətası', textAlign: TextAlign.center, style: TextStyle(
          fontSize: 20,
          color: AppColors.colorError,
          fontWeight: FontWeight.bold
        )),
        const SizedBox(height: 20),
        const Text('Məlumat yüklənilməsi uğursuzdur', textAlign: TextAlign.center, style: TextStyle(
          color: AppColors.colorHintOnWhite,
          fontSize: 17
        )),
        const SizedBox(height: 20),
        AppButton(text: 'Yenidən cəhd et', prefixIcon: Icons.refresh, onPressed: () => controller.refresh())
      ],
    );
  }
}
