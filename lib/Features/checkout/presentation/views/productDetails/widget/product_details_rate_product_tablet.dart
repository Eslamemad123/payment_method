import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsRateProductTablet extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star_rounded,
              size: 18,
              color: Color(0xFF4338CA),
            ),
          ),
        ),
        const Gap(8),
        const Text(
          '4.9',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        const Gap(6),
        const Text(
          '·',
          style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
        ),
        const Gap(6),
        const Text(
          '128 verified reviews',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4338CA),
          ),
        ),
      ],
    );
  }
}
