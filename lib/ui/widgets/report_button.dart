import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';

class ReportButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final Function() onTap;
  const ReportButton({Key? key, required this.text, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            color: AppColors.appBlue.withOpacity(0.3)
          )
        ]
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.appBlue, size: 35),
              const SizedBox(height: 10),
              Text(text, textAlign: TextAlign.center, style: const TextStyle(
                color: AppColors.appBlue,
                fontSize: 17
              ))
            ],
          ),
        ),
      ),
    );
  }
}
