import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;

  const TextWithIcon({Key? key, required this.icon, required this.text, this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}
