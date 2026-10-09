import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'cart_numbet_item_header.dart';
import 'header_tablet_category.dart';

class HeaderProuductsMobaileScreen extends StatelessWidget {
  const HeaderProuductsMobaileScreen({
    super.key,
    this.width = 800,
    this.title = 'Demo Store',
    this.onCartTap,
  });
  final double width;
  final String title;
  final VoidCallback? onCartTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CartNumbetItemHeader(numberItem: 6, onTap: onCartTap),
          const Gap(12),
          Container(height: 18, width: 1.2, color: const Color(0xFFCBD5E1)),
          const Gap(12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const Spacer(),
          if (width > 800) ...[const HeaderTabletCategory(), const Spacer()],
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFF4338CA),
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
