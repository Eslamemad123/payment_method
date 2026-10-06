import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';

class TechnicalHighlightChip extends StatelessWidget {
  final TechnicalHighlight highlight;

  const TechnicalHighlightChip({super.key, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(highlight.icon, size: 18, color: const Color(0xFF4338CA)),
          const Gap(8),
          Expanded(
            child: Text(
              highlight.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
