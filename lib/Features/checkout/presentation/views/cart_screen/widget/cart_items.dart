import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/cart_order_summary.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/cart_shipping_banner.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/cart_title_bar.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/list_items_cart.dart';

class CartItems extends StatelessWidget {
  const new({super.key, required this.cartItems});

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartTitleBar(totalCount: 500),
          const Gap(14),
          const CartShippingBanner(),
          const Gap(16),
          ListItemsCart(cartItems: cartItems),
          const Gap(8),
          CartOrderSummary(subtotal: 360),
          const Gap(24),
        ],
      ),
    );
  }
}
