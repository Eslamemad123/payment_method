import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/body/product_price_row.dart';

class ProductTabletPriceCard extends StatelessWidget {
  final String price;
  final String originalPrice;

  const ProductTabletPriceCard({
    super.key,
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ProductPriceRow(price: price, originalPrice: originalPrice),
    );
  }
}
