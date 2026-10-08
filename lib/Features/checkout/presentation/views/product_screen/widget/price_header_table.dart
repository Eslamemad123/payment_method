import 'package:flutter/material.dart';

class PriceHeaderTable extends StatelessWidget {
  const new({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Live Cart Total',
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          '\$${total.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Color(0xFF172033),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
