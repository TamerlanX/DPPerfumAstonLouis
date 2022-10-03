import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';

class ReportLabel extends StatelessWidget {

  final String title;
  final Map<String, String> values;

  const ReportLabel({Key? key, required this.title, required this.values }) : super(key: key);

  Widget _getLine({ required String label, required String value }) {
    return Expanded(child: Column(
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
    ));
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> items = [];
    values.forEach((key, value) {
      items.add(_getLine(label: key, value: value));
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, textAlign: TextAlign.center, style: const TextStyle(
            color: AppColors.appBlue,
            fontWeight: FontWeight.bold
          )),
          const SizedBox(height: 10),
          Row(children: items)
        ]
      ),
    );
  }
}











