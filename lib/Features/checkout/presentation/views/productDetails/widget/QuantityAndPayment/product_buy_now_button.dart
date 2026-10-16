import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo_implementation.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

class ProductBuyNowButton extends StatelessWidget {
  final int? subtotal;
  final CartItemModel cartItem;

  const ProductBuyNowButton({super.key, this.subtotal, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentCubit(CheckPaymentImplement()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final qty = state.quantityOf(cartItem.productId);
              final buyQty = qty > 0
                  ? qty
                  : (cartItem.quantity > 0 ? cartItem.quantity : 1);
              final itemSubtotal = buyQty * cartItem.price;
              final amount = subtotal ?? itemSubtotal.toInt();

              return SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3730A3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    final isSingle = subtotal == null;
                    final singleProduct = cartItem.copyWith(quantity: buyQty);
                    final checkoutItems = isSingle ? [singleProduct] : null;

                    context.read<PaymentCubit>().amount = amount;
                    context.read<PaymentCubit>().items = checkoutItems;

                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      builder: (sheetContext) {
                        return BlocProvider.value(
                          value: context.read<PaymentCubit>(),
                          child: PaymentMethodsBottomSheet(),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock_outline_rounded, size: 18),
                      const Gap(8),
                      Text(
                        'Buy Now  \$$amount',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
