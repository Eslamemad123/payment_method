import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../productDetails/widget/QuantityAndPayment/add_sub_items_count.dart';

class CounteritemCart extends StatelessWidget {
  const new({
    super.key,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
  });

  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Quantity Stepper
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: AddSubItemsCount(
            colorSub: Colors.white,
            coloradd: Colors.deepPurple,
            size: 18,
            onDecrement: onDecrease,
            onIncrement: onIncrease,
            quantity: 2,
          ),
        ),
        const Gap(8),

        // Remove button
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(6),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete_outline_rounded,
                    size: 16,
                    color: Color(0xFFDC2626),
                  ),
                  Gap(3),
                  Text(
                    'Remove',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
