import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/tabletUi/leftSide/product_tablet_hero_image_card.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/tabletUi/leftSide/product_tablet_warranty_card.dart';

class ProductDetailsBodyTabletLeftScreen extends StatelessWidget {
  const new({super.key, required this.product});

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductTabletHeroImageCard(
          images: product.images,
          fallbackImage: product.image,
          tag: product.tag,
          selectedIndex: 0,
          onSelectImage: (index) {},
        ),
        const Gap(16),
        const ProductTabletWarrantyCard(),
      ],
    );
  }
}
