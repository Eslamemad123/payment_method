import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemsDetailsMobail extends StatelessWidget {
  const CartItemsDetailsMobail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFF1F5FD),
          border: Border.all(color: const Color(0xFFE0E7FF), width: 1),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 20,
              color: Color(0xFF4338CA),
            ),
            const Gap(8),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF475569),
                ),
                children: [
                  TextSpan(
                    text: 'Items in Cart: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '6 units',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF4338CA),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'LIVE SYNC',
                  style: TextStyle(
                    color: Color(0xFF4338CA),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap(6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4338CA),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
