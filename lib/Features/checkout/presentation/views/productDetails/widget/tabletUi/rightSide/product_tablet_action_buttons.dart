import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/product_buy_now_button.dart';

import '../../QuantityAndPayment/product_details_add_to_cart_button.dart';
import '../../QuantityAndPayment/product_details_method_supported_payment.dart';

class ProductTabletActionButtons extends StatelessWidget {
  final int subtotal;
  final VoidCallback? onAddToCart;

  const ProductTabletActionButtons({
    super.key,
    required this.subtotal,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Buy Now Button (Deep Indigo / Purple)
            Expanded(flex: 5, child: ProductBuyNowButton(subtotal: 3)),
            const Gap(14),
            ProductDetailsAddToCartButton(onAddToCart: onAddToCart),
          ],
        ),
        const Gap(16),
        ProductDetailsMethodSupportedPayment(),
      ],
    );
  }
}
