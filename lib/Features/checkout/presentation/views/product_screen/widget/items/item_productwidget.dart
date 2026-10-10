import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/items/item_product_counter_widget.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/tabletWidget/product_image_thumbnail_tablet.dart';

import 'description_cart_product.dart';

class ItemProductwidget extends StatelessWidget {
  const ItemProductwidget({super.key, required this.product});

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
              size: 96,
            ),
            const Gap(14),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionCartProduct(
                    title: product.title,
                    description: product.description,
                  ),
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
        ItemProductCounterWidget(quantity: product.quantity),
      ],
    );
  }
}
