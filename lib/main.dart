import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:device_preview/device_preview.dart';
import 'package:kashier_flutter_sdk/kashier_flutter_sdk.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/layout_builder_customize.dart';
import 'package:payment_method/core/utils/api_keys.dart';

const bool useDevicePreview = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.puplishableKeyStripe;

  runApp(
    KashierPaymentProvider(
      child: DevicePreview(
        enabled: useDevicePreview,
        builder: (context) => const CheckoutApp(),
      ),
    ),
  );
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const MyProductsScreen(),
      ),
    );
  }
}
