import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
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

  const ProductDetailsViewBody({super.key, required this.product});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late int quantity;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    quantity = widget.product.quantity > 0 ? widget.product.quantity : 1;
  }

  int get unitPrice => int.tryParse(widget.product.price) ?? 0;
  int get subtotal => unitPrice * quantity;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final description = product.longDescription.isNotEmpty
        ? product.longDescription
        : product.description;

    return Column(
      children: [
        const HeaderProuductsMobaileScreen(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(6),
                ProductDetailsSubHeader(),
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
                  subtotal: subtotal,
                  onIncrement: incrementQuantity,
                  onDecrement: decrementQuantity,
                ),
                const Gap(14),
                const ProductWarrantyRow(),
                const Gap(24),
                ProductBuyNowButton(subtotal: subtotal),
                const Gap(24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
