import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'add_sub_items_count.dart';

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
