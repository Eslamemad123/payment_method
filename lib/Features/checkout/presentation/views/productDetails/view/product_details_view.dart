import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_tablet_body.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductItemModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 700) {
              return ProductDetailsViewBody(product: product);
            } else {
              return ProductDetailsTabletBody(product: product);
            }
          },
        ),
      ),
    );
  }
}
