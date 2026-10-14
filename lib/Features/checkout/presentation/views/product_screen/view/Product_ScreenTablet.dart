import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/tabletWidget/header_cart_tablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header/header_mobaile_screen.dart';

import '../widget/tabletWidget/grid_view_tablet.dart';

class ProductsTabletBody extends StatelessWidget {
  const ProductsTabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderProuductsMobaileScreen(onCartTap: () {}),
        CheckoutHeader(),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridViewTablet(),
          ),
        ),
      ],
    );
  }
}

