import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/cart_numbet_item_header.dart';

import 'price_header_table.dart';

class TitelHeaderTablet extends StatelessWidget {
  const new({super.key, required this.total, required this.onCheckout});

  final double total;
  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(70, 56, 48, 163),
          ),
          child: CartNumbetItemHeader(numberItem: 3),
        ),
        const SizedBox(width: 12),

        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FLUTTER PAYMENT DEMO',
                style: TextStyle(
                  color: Color(0xFF4F46E5),
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Catalog & Fast Checkout',
                style: TextStyle(
                  color: Color(0xFF172033),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        PriceHeaderTable(total: total),

        const SizedBox(width: 12),

        SizedBox(
          height: 34,
          child: ElevatedButton(
            onPressed: onCheckout,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3926D6),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 6),
                Icon(Icons.arrow_forward_rounded, size: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
