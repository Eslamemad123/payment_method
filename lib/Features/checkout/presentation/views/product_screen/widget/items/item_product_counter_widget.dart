import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/QuantityAndPayment/qunatity.dart';

class ItemProductCounterWidget extends StatelessWidget {
  final CartItemModel cartItem;
  const ItemProductCounterWidget({super.key, required this.cartItem});

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
              cartItem.name,
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
          CartQuantityControl(
            colorSub: Colors.white,
            coloradd: const Color(0xFF4338CA),
            item: cartItem,
          ),
        ],
      ),
    );
  }
}
