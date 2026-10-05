import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/item_product_counter_widget.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/product_image_thumbnail.dart';

class itemProductwidget extends StatelessWidget {
  const new({super.key, required this.product});

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with optional Badge
            ProductImageThumbnail(
              imagePath: product.image,
              badge: product.badge,
              badgeColor: product.badgeColor,
            ),
            const Gap(14),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF64748B),
                      height: 1.3,
                    ),
                  ),
                  const Gap(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const Gap(4),
                      const Text(
                        'USD',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(14),
        // Quantity Selector Bar
        itemProductCounterWidget(quantity: product.quantity),
      ],
    );
  }
}
