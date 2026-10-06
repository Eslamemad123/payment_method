import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleProductDetails extends StatelessWidget {
  const new({super.key, required this.category, required this.title});

  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
            letterSpacing: 0.8,
          ),
        ),
        const Gap(4),

        // Product Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.4,
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
