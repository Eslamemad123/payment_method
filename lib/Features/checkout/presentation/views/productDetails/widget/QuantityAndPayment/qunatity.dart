import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/add_sub_items_count.dart';

class CartQuantityControl extends StatelessWidget {
  const CartQuantityControl({
    super.key,
    required this.item,
    this.size = 36,
    this.colorSub = const Color(0xFFE0E7FF),
    this.coloradd = const Color(0xFF4338CA),
  });

  final CartItemModel item;
  final double size;
  final Color colorSub;
  final Color coloradd;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return AddSubItemsCount(
          size: size,
          colorSub: colorSub,
          coloradd: coloradd,
          quantity: state.quantityOf(item.productId),
          onIncrement: () => context.read<CartCubit>().increment(item),
          onDecrement: () =>
              context.read<CartCubit>().decrement(item.productId),
        );
      },
    );
  }
}
