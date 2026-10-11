import 'package:flutter/material.dart';
import 'package:payment_method/core/const/products_model_list.dart';

import 'product_card.dart';

class ListProductsMobaileScreen extends StatelessWidget {
  const ListProductsMobaileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 24),
      sliver: SliverList.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
