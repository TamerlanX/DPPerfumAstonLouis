import 'package:flutter/material.dart';

import '../core/ui_values.dart';

class VerticalDataLabel extends StatelessWidget {

  final String label;
  final String value;
  const VerticalDataLabel({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(
            fontSize: 13,
            color: AppColors.colorHintOnWhite
        )),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ))
      ],
    );
  }
}
