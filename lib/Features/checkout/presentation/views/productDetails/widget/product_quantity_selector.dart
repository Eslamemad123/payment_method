import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int quantity;
  final int subtotal;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductQuantitySelector({
    super.key,
    required this.quantity,
    required this.subtotal,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Gap(2),
              Text(
                'Subtotal: \$$subtotal',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Stepper
          AddSubItemsCount(
            onDecrement: onDecrement,
            quantity: quantity,
            onIncrement: onIncrement,
          ),
        ],
      ),
    );
  }
}

class AddSubItemsCount extends StatelessWidget {
  const new({
    super.key,
    required this.onDecrement,
    required this.quantity,
    required this.onIncrement,
    this.size = 36,
    this.color = const Color(0xFFE0E7FF),
  });

  final VoidCallback onDecrement;
  final int quantity;
  final VoidCallback onIncrement;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Minus button
        Material(
          color: color,
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
          color: color,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onIncrement,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(Icons.add, size: 18, color: Color(0xFF4338CA)),
            ),
          ),
        ),
      ],
    );
  }
}
