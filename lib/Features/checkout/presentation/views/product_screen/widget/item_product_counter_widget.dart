import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/quantity_control_button.dart';

class ItemProductCounterWidget extends StatelessWidget {
  final int quantity;
  final String title;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const ItemProductCounterWidget({
    super.key,
    required this.quantity,
    this.title = 'Qty',
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF8FAFC),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF334155),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuantityControlButton(
                icon: Icons.remove,
                isPrimary: false,
                size: 28,
                onTap: onDecrement ?? () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
              QuantityControlButton(
                icon: Icons.add,
                isPrimary: true,
                size: 28,
                onTap: onIncrement ?? () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

