import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header/header_two_prouducts_mobaile_screen.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/items/list_products_mobaile_screen.dart';

import '../../../cart_screen/widget/header/cart_item.dart';
import '../widget/header/header_mobaile_screen.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: HeaderProuductsMobaileScreen()),
        SliverToBoxAdapter(child: HeaderTwoProuductsMobaileScreen()),
        SliverToBoxAdapter(child: CartItemsDetailsMobail()),
        ListProductsMobaileScreen(),
      ],
    );
  }
}
