import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/repo/repo_implementation.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

class BuyButtonCart extends StatelessWidget {
  const new({super.key, required this.onCheckout, required this.subtotal});

  final VoidCallback? onCheckout;
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed:
            onCheckout ??
            () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (bottomSheetContext) {
                  return BlocProvider(
                    create: (context) =>
                        StripePaymentCubit(CheckPaymentImplement()),
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4338CA),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline_rounded, size: 18),
            const Gap(8),
            Text(
              'Proceed to Checkout (\$${subtotal.toStringAsFixed(2)})',
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
