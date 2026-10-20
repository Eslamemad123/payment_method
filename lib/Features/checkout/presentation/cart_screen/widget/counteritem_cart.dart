import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/qunatity.dart';

class CounteritemCart extends StatelessWidget {
  final CartItemModel cartItem;

  const CounteritemCart({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Quantity Stepper
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: CartQuantityControl(
            colorSub: Colors.white,
            coloradd: const Color(0xFF4338CA),
            item: cartItem,
          ),
        ),
        const Gap(8),

        // Remove button
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<CartCubit>().removeItem(cartItem.productId);
            },
            borderRadius: BorderRadius.circular(6),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete_outline_rounded,
                    size: 16,
                    color: Color(0xFFDC2626),
                  ),
                  Gap(3),
                  Text(
                    'Remove',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
