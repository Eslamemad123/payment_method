import 'package:flutter/material.dart';

class SumeryCartItemsTitles extends StatelessWidget {
  const SumeryCartItemsTitles({
    super.key,
    required this.subtitle,
    required this.title,
    this.fontSize = 14,
    this.color = Colors.black,
  });

  final String subtitle;
  final String title;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
