import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:device_preview/device_preview.dart';
import 'package:kashier_flutter_sdk/kashier_flutter_sdk.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/layout_builder_customize.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const bool useDevicePreview = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xfnoiycblhikfdaxwhoc.supabase.co',
    publishableKey: 'sb_publishable_uwHSs8e5wga8Tr8fRPpmTA_ltpmffg6',
  );
  // final secretKey = await PaymentBackend.getKey('puplishableKeyStripe');

  Stripe.publishableKey = 'pk_test_51UHqdBPCef7ujc3pIIpLVpe4vBJJ49HFCp56JQZuWwxBhd8NUOPF6D3j7uu9G9EoO136u6fxBXVLVUz4bFBNEPns002n7x7LSZ';
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
