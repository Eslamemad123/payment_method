import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/add_sub_items_count.dart';

class ItemProductCounterWidget extends StatelessWidget {
  final int quantity;
  final String title;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const ItemProductCounterWidget({
    super.key,
    required this.quantity,
    this.title = 'Quantity',
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFF8FAFC),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF334155),
              ),
            ),
          ),
          const SizedBox(width: 6),
          AddSubItemsCount(
            onDecrement: () {},
            colorSub: Colors.white,
            coloradd: Color(0xFF4338ca),
            quantity: quantity,
            onIncrement: () {},
          ),
        ],
      ),
    );
  }
}
