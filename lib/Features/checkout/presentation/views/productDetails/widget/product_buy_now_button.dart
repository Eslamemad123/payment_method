import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/repo/repo_implementation.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

class ProductBuyNowButton extends StatelessWidget {
  final int subtotal;

  const ProductBuyNowButton({super.key, required this.subtotal});

  @override
  Widget build(BuildContext context) {
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
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (context) {
              return BlocProvider(
                create: (context) =>
                    StripePaymentCubit(CheckPaymentImplement()),
                child: const PaymentMethodsBottomSheet(),
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 18,
              color: Colors.white,
            ),
            const Gap(8),
            Text(
              'Buy Now  \$$subtotal',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
