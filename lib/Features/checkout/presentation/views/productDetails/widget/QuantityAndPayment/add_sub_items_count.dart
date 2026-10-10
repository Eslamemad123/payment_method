import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddSubItemsCount extends StatelessWidget {
  const new({
    super.key,
    required this.onDecrement,
    required this.quantity,
    required this.onIncrement,
    this.size = 36,
    this.colorSub = const Color(0xFFE0E7FF),
    this.coloradd = const Color(0xFFE0E7FF),
  });

  final VoidCallback onDecrement;
  final int quantity;
  final VoidCallback onIncrement;
  final double size;
  final Color colorSub;
  final Color coloradd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Minus button
        Material(
          color: colorSub,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onDecrement,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(Icons.remove, size: 18, color: Color(0xFF4338CA)),
            ),
          ),
        ),
        const Gap(14),
        Text(
          '$quantity',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        const Gap(14),
        // Plus button
        Material(
          color: coloradd,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onIncrement,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(Icons.add, size: 18, color: Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ],
    );
  }
}
