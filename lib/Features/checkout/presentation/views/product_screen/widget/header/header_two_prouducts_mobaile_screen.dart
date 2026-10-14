import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'fintech_demo_badge_header_product_screen.dart';

class HeaderTwoProuductsMobaileScreen extends StatelessWidget {
  const HeaderTwoProuductsMobaileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Explore Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),
              Spacer(),
              FintechDemoBadgeHeaderProductScreen(),
            ],
          ),
          Gap(6),
          Text(
            'Tap any product to view details & secure checkout flow.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF64748B),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
