import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header_two_prouducts_mobaile_screen.dart';

import 'cart_item.dart';
import 'header_mobaile_screen.dart';
import 'list_products_mobaile_screen.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderProuductsMobaileScreen(),
          const HeaderTwoProuductsMobaileScreen(),
          const CartItemsDetailsMobail(),
          ListProductsMobaileScreen(),
        ],
      ),
    );
  }
}
