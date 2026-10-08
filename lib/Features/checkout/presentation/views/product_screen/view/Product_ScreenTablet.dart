import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header_cart_tablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header_mobaile_screen.dart';

class ProductsTabletBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const HeaderProuductsMobaileScreen(), CheckoutHeader()],
    );
  }
}
