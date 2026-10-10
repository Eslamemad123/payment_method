import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/summary/cart_order_summary.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/header/cart_shipping_banner.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/header/cart_title_bar.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/body/list_items_cart.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, required this.cartItems});

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    final double computedSubtotal = cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    final int computedCount = cartItems.fold(
      0,
      (sum, item) => sum + item.quantity,
    );

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartTitleBar(totalCount: computedCount),
          const Gap(14),
          const CartShippingBanner(),
          const Gap(16),
          ListItemsCart(cartItems: cartItems),
          const Gap(8),
          CartOrderSummary(subtotal: computedSubtotal),
          const Gap(24),
        ],
      ),
    );
  }
}
