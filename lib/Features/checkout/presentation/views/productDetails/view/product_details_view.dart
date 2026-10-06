import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductItemModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
