import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/product_buy_now_button.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/product_details_method_supported_payment.dart';

import 'sumery_cart_items_titles.dart';

class CartOrderSummary extends StatelessWidget {
  final double subtotal;
  final VoidCallback? onCheckout;
  final CartItemModel cartItem;

  const CartOrderSummary({
    super.key,
    required this.subtotal,
    required this.cartItem,
    this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Subtotal Row
          SumeryCartItemsTitles(
            title: 'Sub Total',
            subtitle: '\$${subtotal.toStringAsFixed(2)}',
          ),
          const Gap(8),
          SumeryCartItemsTitles(
            title: ' Shipping',
            subtitle: 'FREE',
            color: Color(0xFF16A34A),
          ),

          // Shipping Row
          const Gap(12),
          const Divider(height: 1, color: Color(0xFFF1F5F9), thickness: 1),
          const Gap(12),
          SumeryCartItemsTitles(
            title: 'Estimated Total',
            subtitle: '\$${subtotal.toStringAsFixed(2)}',
            color: Color(0xFF4338CA),
            fontSize: 16,
          ),

          const Gap(16),

          ProductBuyNowButton(subtotal: subtotal.round(), cartItem: cartItem),
          Gap(10),

          ProductDetailsMethodSupportedPayment(),
        ],
      ),
    );
  }
}
