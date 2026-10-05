import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/view/product_screen.dart';
import 'package:payment_method/core/utils/api_keys.dart';

void main() {
  Stripe.publishableKey = ApiKeys.puplishableKeyStripe;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProductsScreen(),
    );
  }
}
