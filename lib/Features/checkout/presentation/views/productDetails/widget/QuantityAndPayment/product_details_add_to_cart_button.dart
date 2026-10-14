import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsAddToCartButton extends StatelessWidget {
  const new({super.key, required this.onAddToCart});

  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: SizedBox(
        height: 52,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF4338CA),
            side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 0,
          ),
          onPressed:
              onAddToCart ??
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 20),
                        Gap(10),
                        Text('Item added to cart successfully!'),
                      ],
                    ),
                    backgroundColor: const Color(0xFF4338CA),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 18,
                color: Color(0xFF4338CA),
              ),
              Gap(8),
              Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4338CA),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
