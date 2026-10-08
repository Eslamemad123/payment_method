import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/view/product_details_view.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header_two_prouducts_mobaile_screen.dart';

import 'cart_item.dart';
import 'header_mobaile_screen.dart';
import 'item_productwidget.dart';
import 'list_products_mobaile_screen.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderProuductsMobaileScreen(),
          const HeaderTwoProuductsMobaileScreen(),
          const CartItemsDetailsMobail(),
          ListProductsMobaileScreen(),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductItemModel product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsView(product: product),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: itemProductwidget(product: product),
        ),
      ),
    );
  }
}
