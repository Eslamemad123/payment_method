import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'cart_numbet_item_header.dart';
import 'header_tablet_category.dart';

class HeaderProuductsMobaileScreen extends StatelessWidget {
  const HeaderProuductsMobaileScreen({super.key, this.width = 800});
  final int width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CartNumbetItemHeader(numberItem: 6),
          const Gap(14),
          const Text(
            'Store Catalog',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const Spacer(),
          if (width > 600) ...[HeaderTabletCategory(), Spacer()],
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
