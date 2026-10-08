import 'package:flutter/material.dart';

class CartNumbetItemHeader extends StatelessWidget {
  final int numberItem;
  const new({super.key, required this.numberItem});
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              '${numberItem.toString()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
