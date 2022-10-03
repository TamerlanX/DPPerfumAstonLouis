import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class EmptyBox extends StatelessWidget {

  final String? text;

  const EmptyBox({ Key? key, this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Ionicons.layers_outline, color: AppColors.colorHintOnWhite, size: 60),
        const SizedBox(height: 15),
        Text(text ?? 'Məlumat yoxdur', textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.colorHintOnWhite, fontSize: 20))
      ],
    );
  }
}