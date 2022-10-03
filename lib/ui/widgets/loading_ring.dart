import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingRing extends StatelessWidget {

  final String? text;

  const LoadingRing({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: ListView(
        shrinkWrap: true,
        children: [
          const SpinKitDualRing(
            color: AppColors.colorInfo,
            //duration: Duration(milliseconds: 700),
            lineWidth: 3,
            size: 40.0,
          ),
          const SizedBox(height: 10),
          Center(child: Text(text ?? 'Yüklənir...', style: const TextStyle(fontSize: 16)))
        ]));
  }
}