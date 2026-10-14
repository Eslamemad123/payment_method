import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/view/shopping_cart_view.dart';

class CartNumbetItemHeader extends StatelessWidget {
  final int numberItem;
  final VoidCallback? onTap;

  const CartNumbetItemHeader({
    super.key,
    required this.numberItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShoppingCartView(),
              ),
            );
          },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 28,
              color: Color(0xFF0F172A),
            ),
            Positioned(
              top: -3,
              right: -5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF4338CA),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  numberItem.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
