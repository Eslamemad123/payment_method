import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/view/product_details_view.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/tabletWidget/cart_item_product_tablet.dart';
import 'package:payment_method/core/const/products_model_list.dart';

class GridViewTablet extends StatelessWidget {
  const GridViewTablet({
    super.key,
    this.selectedIndex,
    this.onProductSelected,
    this.childAspectRatio,
  });

  final int? selectedIndex;
  final ValueChanged<int>? onProductSelected;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75, // أضف السطر ده
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final isSelected = selectedIndex == index;
        return InkWell(
          onTap: () {
            if (onProductSelected != null) {
              onProductSelected!(index);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsView(product: products[index]),
                ),
              );
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF4338CA)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: CartItemProductTablet(index: index),
          ),
        );
      },
    );
  }
}
