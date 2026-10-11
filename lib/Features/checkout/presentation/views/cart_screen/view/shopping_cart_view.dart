import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/body/cart_empty_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/header/cart_top_header.dart';

import '../widget/cart_items.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // Top Header (Demo Store | Master-Detail Studio)
                    CartTopHeader(
                      totalCount: state.itemsCount,
                      onClose: () => Navigator.of(context).maybePop(),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE2E8F0),
                    ),

                    // Main Content
                    Expanded(
                      child: state.items.isEmpty
                          ? const CartEmptyState()
                          : CartItems(
                              cartItems: state.items,
                              totalCount: state.itemsCount,
                              subtotal: state.subTotal,
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
