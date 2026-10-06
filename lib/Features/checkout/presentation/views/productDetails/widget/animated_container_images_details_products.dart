import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_hero_image_card.dart';

class AnimatedContainerImagesDetailsProducts extends StatelessWidget {
  const new({super.key, required this.widget, required this.currentImageIndex});

  final ProductHeroImageCard widget;
  final int currentImageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.images.length, (index) {
        final isActive = index == currentImageIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 22 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF4338CA)
                : const Color(0xFF94A3B8).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
