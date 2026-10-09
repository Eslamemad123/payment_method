import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_method_supported_payment.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header_mobaile_screen.dart';

import 'product_buy_now_button.dart';
import 'product_description_box.dart';
import 'product_details_sub_header.dart';
import 'product_hero_image_card.dart';
import 'product_price_row.dart';
import 'product_quantity_selector.dart';
import 'product_technical_highlights.dart';
import 'product_warranty_row.dart';
import 'title_product_details.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ProductItemModel product;
  final bool showHeader;
  final bool showBackButton;

  const ProductDetailsViewBody({
    super.key,
    required this.product,
    this.showHeader = true,
    this.showBackButton = true,
  });

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late int quantity = 3;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final description = product.longDescription.isNotEmpty
        ? product.longDescription
        : product.description;

    return Column(
      children: [
        if (widget.showHeader)
          HeaderProuductsMobaileScreen(width: MediaQuery.of(context).size.width),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(6),
                ProductDetailsSubHeader(showBackButton: widget.showBackButton),
                const Gap(14),
                ProductHeroImageCard(images: product.images),
                const Gap(20),
                TitleProductDetails(
                  category: product.category,
                  title: product.title,
                ),
                ProductPriceRow(
                  price: product.price,
                  originalPrice: product.originalPrice,
                ),
                const Gap(8),
                ProductDescriptionBox(description: description),
                const Gap(20),
                ProductTechnicalHighlights(highlights: product.highlights),
                const Gap(20),
                ProductQuantitySelector(
                  quantity: quantity,
                  subtotal: 2,
                  onIncrement: () {},
                  onDecrement: () {},
                ),
                const Gap(14),
                const ProductWarrantyRow(),
                const Gap(24),
                ProductBuyNowButton(subtotal: 3),
                Gap(12),
                ProductDetailsMethodSupportedPayment(),
                const Gap(24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
