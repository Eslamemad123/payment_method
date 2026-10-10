import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/view/Product_ScreenTablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/view/products_desktop_screen.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/view/products_view_bodyMobail.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const ProductsViewBody();
            } else if (constraints.maxWidth <= 1080) {
              return const ProductsTabletBody();
            } else {
              return const ProductsScreenDesktop();
            }
          },
        ),
      ),
    );
  }
}
