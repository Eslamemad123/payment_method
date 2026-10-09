import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/cart_empty_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/cart_top_header.dart';
import 'package:payment_method/core/const/app_assets.dart';

import '../widget/cart_items.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final List<CartItemModel> cartItems = [
    CartItemModel(
      title: 'Horizon Wireless ANC',
      price: 249.0,
      image: AppAssets.headPhone,
      quantity: 2,
    ),
    CartItemModel(
      title: 'Nova Mechanical Keyboard',
      price: 139.0,
      image: AppAssets.keyboard,
      quantity: 1,
    ),
    CartItemModel(
      title: 'Aura Smartwatch Pro',
      price: 299.0,
      image: AppAssets.clock,
      quantity: 3,
    ),
  ];
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
