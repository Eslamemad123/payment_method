import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductPriceRow extends StatelessWidget {
  final String price;
  final String originalPrice;

  const ProductPriceRow({
    super.key,
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Current Price
        Text(
          '\$$price',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const Gap(8),
        // Strikethrough Price
        Text(
          '\$$originalPrice',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF94A3B8),
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const Spacer(),
        // Free Express Delivery Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.local_shipping_outlined,
                size: 15,
                color: Color(0xFF4338CA),
              ),
              Gap(5),
              Text(
                'Free express delivery',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4338CA),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
