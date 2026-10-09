import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartTitleBar extends StatelessWidget {
  final int totalCount;

  const CartTitleBar({
    super.key,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.shopping_cart_outlined,
          color: Color(0xFF4338CA),
          size: 24,
        ),
        const Gap(10),
        const Text(
          'Shopping Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.4,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE9FE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$totalCount items',
            style: const TextStyle(
              color: Color(0xFF4338CA),
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
          ),
        ),
      ],
    );
  }
}
