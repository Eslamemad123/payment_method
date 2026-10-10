import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';

class ProductDetailsCategoryAndCodeItemTablet extends StatelessWidget {
  const new({super.key, required this.product});

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            product.category.toUpperCase(),
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w800,
              color: Color(0xFF4338CA),
              letterSpacing: 0.6,
            ),
          ),
        ),
        const Spacer(),
        Text(
          product.sku,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF64748B),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
