import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductTabletWarrantyCard extends StatelessWidget {
  const ProductTabletWarrantyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WarrantyItem(
            icon: Icons.verified_user_outlined,
            title: '2-Year Warranty',
            subtitle: 'Global coverage',
          ),
          Divider(color: const Color(0xFFF1F5F9), height: 1),
          WarrantyItem(
            icon: Icons.local_shipping_outlined,
            title: 'Express Delivery',
            subtitle: 'Next-day available',
          ),
          Divider(color: const Color(0xFFF1F5F9), height: 1),
          WarrantyItem(
            icon: Icons.sync_rounded,
            title: '30-Day Trial',
            subtitle: 'Risk-free return',
          ),
        ],
      ),
    );
  }
}

class WarrantyItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const WarrantyItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: const Color(0xFF4338CA)),
        const Gap(6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(2),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
