import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartShippingBanner extends StatelessWidget {
  const CartShippingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E7FF), width: 1),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.local_shipping_outlined,
            color: Color(0xFF4338CA),
            size: 20,
          ),
          Gap(10),
          Expanded(
            child: Text(
              'Free Express Shipping',
              style: TextStyle(
                color: Color(0xFF4338CA),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Spacer(),
          FittedBox(
            fit: BoxFit.scaleDown,

            child: Text(
              'Unlocked',
              style: TextStyle(
                color: Color(0xFF4338CA),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
