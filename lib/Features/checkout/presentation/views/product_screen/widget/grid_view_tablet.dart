import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/view/product_details_view.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/cart_item_product_tablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/products_model_list.dart';

class GridViewTablet extends StatelessWidget {
  const new({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsView(product: products[index]),
              ),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: CartItemProductTablet(index: index),
        );
      },
    );
  }
}
