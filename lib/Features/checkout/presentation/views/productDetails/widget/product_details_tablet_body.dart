import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header/header_mobaile_screen.dart';

import 'tabletUi/product_details_body_tablet.dart';

class ProductDetailsTabletBody extends StatelessWidget {
  final ProductItemModel product;

  const ProductDetailsTabletBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderProuductsMobaileScreen(width: 800, title: 'Demo Store'),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 0, 92, 212),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: ProductDetailsBodyTablet(product: product),
          ),
        ),
      ],
    );
  }
}
