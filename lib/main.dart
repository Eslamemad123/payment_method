import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:device_preview/device_preview.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen.dart';
import 'package:payment_method/core/utils/api_keys.dart';

// غيّر القيمة دي للتبديل بين الوضعين
const bool useDevicePreview = true;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.puplishableKeyStripe;

  runApp(
    DevicePreview(
      enabled: useDevicePreview,
      builder: (context) => const CheckoutApp(),
    ),
  );
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const MyProductsScreen(),
    );
  }
}
