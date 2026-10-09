import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_sub_header.dart';

import 'product_details_body_tablet_left_screen.dart';
import 'product_details_body_tablet_right_screen.dart';

class ProductDetailsBodyTablet extends StatelessWidget {
  const new({super.key, required this.product});

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProductDetailsSubHeader(),
        const Gap(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ProductDetailsBodyTabletLeftScreen(product: product),
            ),
            const Gap(28),
            Expanded(
              flex: 6,
              child: ProductDetailsBodyTabletRightScreen(product: product),
            ),
          ],
        ),
      ],
    );
  }
}
