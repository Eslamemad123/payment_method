import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/body/cart_item_card.dart';

class ListItemsCart extends StatelessWidget {
  const new({super.key, required this.cartItems});

  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return CartItemCard(
          key: ValueKey(item.title),
          item: item,
          onIncrease: () => () {},
          onDecrease: () => () {},
          onRemove: () => () {},
        );
      },
    );
  }
}
