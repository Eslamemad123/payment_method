import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FintechDemoBadgeHeaderProductScreen extends StatelessWidget {
  const FintechDemoBadgeHeaderProductScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFEDE9FE),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified_outlined, size: 15, color: Color(0xFF4338CA)),
          Gap(4),
          Text(
            'Fintech Demo',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4338CA),
            ),
          ),
        ],
      ),
    );
  }
}
