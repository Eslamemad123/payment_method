import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/body/cart_empty_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/header/cart_top_header.dart';
import 'package:payment_method/core/const/cartItem.dart';

import '../widget/cart_items.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Column(
              children: [
                // Top Header (Demo Store | Master-Detail Studio)
                CartTopHeader(
                  totalCount: 500,
                  onClose: () => Navigator.of(context).maybePop(),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFE2E8F0),
                ),

                // Main Content
                Expanded(
                  child: cartItems.isEmpty
                      ? const CartEmptyState()
                      : CartItems(cartItems: cartItems),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
