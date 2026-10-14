import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/body/technical_highlight_chip.dart';

class ProductTechnicalHighlights extends StatelessWidget {
  final List<TechnicalHighlight> highlights;

  const ProductTechnicalHighlights({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    if (highlights.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TECHNICAL HIGHLIGHTS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
            letterSpacing: 0.8,
          ),
        ),
        const Gap(10),
        // 2x2 grid representation
        for (int i = 0; i < highlights.length; i += 2) ...[
          Row(
            children: [
              Expanded(child: TechnicalHighlightChip(highlight: highlights[i])),
              if (i + 1 < highlights.length) ...[
                const Gap(10),
                Expanded(
                  child: TechnicalHighlightChip(highlight: highlights[i + 1]),
                ),
              ] else ...[
                const Gap(10),
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
          if (i + 2 < highlights.length) const Gap(10),
        ],
      ],
    );
  }
}
