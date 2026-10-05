import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/quantity_control_button.dart';

class itemProductCounterWidget extends StatelessWidget {
  const new({super.key, required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF8FAFC),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        children: [
          const Text(
            'Selected Quantity',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155),
            ),
          ),
          const Spacer(),
          // Minus Button
          QuantityControlButton(
            icon: Icons.remove,
            isPrimary: false,
            onTap: () {},
          ),
          const Gap(16),
          Text(
            '${quantity}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const Gap(16),
          // Plus Button
          QuantityControlButton(icon: Icons.add, isPrimary: true, onTap: () {}),
        ],
      ),
    );
  }
}
