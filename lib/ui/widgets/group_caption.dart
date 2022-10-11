import 'package:flutter/material.dart';

import '../core/ui_values.dart';

class GroupCaption extends StatelessWidget {
  final String text;
  const GroupCaption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: const BoxDecoration(
            color: AppColors.appBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        child: Text(text, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)));
  }
}
