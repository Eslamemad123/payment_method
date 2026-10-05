import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/products_model_list.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/products_view_body.dart';

class ListProductsMobaileScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}
