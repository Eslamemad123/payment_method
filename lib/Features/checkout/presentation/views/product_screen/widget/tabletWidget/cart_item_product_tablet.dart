import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/items/item_product_counter_widget.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/tabletWidget/product_image_thumbnail_tablet.dart';
import 'package:payment_method/core/const/products_model_list.dart';
import 'package:payment_method/core/const/app_color.dart';

import 'title_and_price_cart_product_tablet.dart';

class CartItemProductTablet extends StatefulWidget {
  final int index;

  const CartItemProductTablet({super.key, required this.index});

  @override
  State<CartItemProductTablet> createState() => _CartItemProductTabletState();
}

class _CartItemProductTabletState extends State<CartItemProductTablet> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = products[widget.index].quantity;
  }

  @override
  void didUpdateWidget(covariant CartItemProductTablet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _quantity = products[widget.index].quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = products[widget.index];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Product Image
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ProductImageThumbnail(
                imagePath: product.image,
                badge: product.badge,
                badgeColor: product.badgeColor,
              ),
            ),
          ),
          const Gap(10),
          TitleAndPriceCartProductTablet(product: product),
          const Gap(4),
          Text(
            product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF64748B),
              height: 1.3,
            ),
          ),
          const Gap(10),
          ItemProductCounterWidget(
            quantity: _quantity,
            onIncrement: () {},
            onDecrement: () {},
          ),
        ],
      ),
    );
  }
}
