import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../data/models/cart_item_model.dart';
import '../counteritem_cart.dart';
import 'title_and_price_cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 65,
              height: 65,
              color: const Color(0xFFF8FAFC),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFF1F5F9),
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
            ),
          ),
          const Gap(12),

          // Title & Price
          TitleAndPriceCartItem(item: item),
          const Gap(8),

          // Stepper & Remove Action
          CounteritemCart(
            onDecrease: onDecrease,
            onIncrease: onIncrease,
            onRemove: onRemove,
          ),
        ],
      ),
    );
  }
}
