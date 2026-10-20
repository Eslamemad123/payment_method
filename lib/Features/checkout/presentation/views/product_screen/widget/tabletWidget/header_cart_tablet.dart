import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/view/shopping_cart_view.dart';

import 'titel_header_tablet.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({
    super.key,
    this.cartCount,
    this.total,
    this.onCheckout,
  });

  final int? cartCount;
  final double? total;
  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final double currentTotal = total ?? state.subTotal;
        final int currentCount = cartCount ?? state.itemsCount;

        return Container(
          height: 62,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFF4F46E5), width: 1)),
            boxShadow: [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TitelHeaderTablet(
            total: currentTotal,
            cartCount: currentCount,
            onCheckout:
                onCheckout ??
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCartView(),
                    ),
                  );
                },
          ),
        );
      },
    );
  }
}
