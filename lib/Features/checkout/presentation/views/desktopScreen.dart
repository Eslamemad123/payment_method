import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/widget/cart_items.dart';
import 'package:payment_method/Features/checkout/presentation/views/productDetails/widget/product_details_view_body.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/grid_view_tablet.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_screen/widget/header_mobaile_screen.dart';
import 'package:payment_method/core/const/products_model_list.dart';
import 'package:payment_method/core/const/cartItem.dart';

class ProductsScreenDesktop extends StatefulWidget {
  const ProductsScreenDesktop({super.key});

  @override
  State<ProductsScreenDesktop> createState() => _ProductsScreenDesktopState();
}

class _ProductsScreenDesktopState extends State<ProductsScreenDesktop> {
  int selectedProductIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              HeaderProuductsMobaileScreen(
                width: screenWidth,
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFE2E8F0),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left panel: Cart Items
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: CartItems(cartItems: cartItems),
                      ),
                    ),

                    const VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Color(0xFFE2E8F0),
                    ),

                    // Center panel: Products Catalog
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: const Color(0xFFF8FAFC),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: LayoutBuilder(
                          builder: (context, catalogConstraints) {
                            final int catalogCrossAxisCount =
                                catalogConstraints.maxWidth >= 600 ? 3 : 2;
                            return GridViewTablet(
                              crossAxisCount: catalogCrossAxisCount,
                              selectedIndex: selectedProductIndex,
                              onProductSelected: (index) {
                                setState(() {
                                  selectedProductIndex = index;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),

                    const VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Color(0xFFE2E8F0),
                    ),

                    // Right panel: Selected Product Details
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.white,
                        child: ProductDetailsViewBody(
                          key: ValueKey(selectedProductIndex),
                          product: products[selectedProductIndex],
                          showHeader: false,
                          showBackButton: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
