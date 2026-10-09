import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DescriptionCartProduct extends StatelessWidget {
  const new({super.key, required this.title, required this.description});

  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
            letterSpacing: -0.2,
          ),
        ),
        const Gap(4),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF64748B),
            height: 1.3,
          ),
        ),
        const Gap(8),
      ],
    );
  }
}
