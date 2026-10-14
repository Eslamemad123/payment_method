import 'package:flutter/material.dart';

class HeaderTabletCategory extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Shop',
          style: TextStyle(
            color: Color(0xFF3926D6),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 28),
        Text(
          'Checkout',
          style: TextStyle(color: Color(0xFF4B4F59), fontSize: 12),
        ),
        SizedBox(width: 28),
        Text(
          'Orders',
          style: TextStyle(color: Color(0xFF4B4F59), fontSize: 12),
        ),
      ],
    );
  }
}
