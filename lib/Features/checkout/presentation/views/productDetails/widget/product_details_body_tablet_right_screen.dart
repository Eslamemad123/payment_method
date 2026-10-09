import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_category_and_code_item_tablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_rate_product_tablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_quantity_selector.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_tablet_action_buttons.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_tablet_price_card.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_technical_highlights.dart';

class ProductDetailsBodyTabletRightScreen extends StatelessWidget {
  const new({super.key, required this.product});

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsCategoryAndCodeItemTablet(product: product),
        const Gap(10),
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const Gap(8),
        ProductDetailsRateProductTablet(),
        const Gap(16),
        ProductTabletPriceCard(
          originalPrice: product.originalPrice,
          price: product.price,
        ),

        const Gap(16),
        Text(
          product.longDescription,
          style: const TextStyle(
            fontSize: 13.5,
            height: 1.55,
            color: Color(0xFF475569),
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(20),
        ProductTechnicalHighlights(highlights: product.highlights),
        const Gap(20),
        ProductQuantitySelector(
          quantity: 5,
          subtotal: 2,
          onIncrement: () {},
          onDecrement: () {},
        ),
        const Gap(20),
        const ProductTabletActionButtons(subtotal: 5),
        const Gap(24),
      ],
    );
  }
}
