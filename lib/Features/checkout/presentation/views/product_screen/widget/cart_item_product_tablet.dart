import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/description_cart_product.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/item_product_counter_widget.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/product_image_thumbnail.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/products_model_list.dart';
import 'package:payment_method/core/const/app_color.dart';

class CartItemProductTablet extends StatelessWidget {
  const new({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
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
                imagePath: products[index].image,
                badge: products[index].badge,
                badgeColor: products[index].badgeColor,
                size: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ),

          const Gap(12),

          /// Title + Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DescriptionCartProduct(
                  title: products[index].title,
                  description: products[index].description,
                ),
              ),
              const Gap(8),
              Text(
                '\$${products[index].price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4338CA),
                ),
              ),
            ],
          ),
          const Gap(12),
          SizedBox(
            width: double.infinity,
            child: ItemProductCounterWidget(quantity: products[index].quantity),
          ),
        ],
      ),
    );
  }
}
