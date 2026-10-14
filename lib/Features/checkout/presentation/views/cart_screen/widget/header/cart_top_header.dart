import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header/header_mobaile_screen.dart';

class CartTopHeader extends StatelessWidget {
  final int totalCount;
  final VoidCallback? onClose;

  const CartTopHeader({super.key, required this.totalCount, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Back button
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: onClose ?? () => Navigator.of(context).maybePop(),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ),
          const Gap(12),

          // Bag icon with counter badge
          Expanded(child: HeaderProuductsMobaileScreen()),

          // Close button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onClose ?? () => Navigator.of(context).maybePop(),
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.close_rounded,
                  color: Color(0xFF64748B),
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
