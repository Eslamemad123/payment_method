import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              _FintechDemoBadge(),
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

class _FintechDemoBadge extends StatelessWidget {
  const _FintechDemoBadge();

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
          Icon(
            Icons.verified_outlined,
            size: 15,
            color: Color(0xFF4338CA),
          ),
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
