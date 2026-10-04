import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgetttttttttttttttttttttt/products_view_body.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: SafeArea(
        child: ProductsViewBody(),
      ),
    );
  }
}
