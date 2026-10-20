import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/paymentSheet/thank_you_view.dart';
import 'package:payment_method/core/function/getTransctionPaypal.dart';
import 'package:payment_method/core/function/paymenMethod/kashier.dart';
import 'package:payment_method/core/function/paymenMethod/payTaps.dart';
import 'package:payment_method/core/function/paymenMethod/paymob.dart';
import 'package:payment_method/core/function/paymenMethod/paypal.dart'
    show paymentPaypal;
import 'package:payment_method/core/function/paymenMethod/stripe.dart';
import 'package:payment_method/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final List<CartItemModel>? items;

  const CustomButtonBlocConsumer({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, paymentState) {
        if (paymentState is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ThankYouView(amount: paymentState.amount),
            ),
          );
        } else if (paymentState is PaymentFailer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(paymentState.errorMessage),
              backgroundColor: Colors.red.shade700,
            ),
          );
        } else if (paymentState is PaymentCancelled) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                paymentState.message ?? 'Payment cancelled by user',
              ),
              backgroundColor: Colors.orange.shade700,
            ),
          );
        } else if (paymentState is PaymentPending) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                paymentState.message ?? 'Payment is pending confirmation',
              ),
              backgroundColor: Colors.blue.shade700,
            ),
          );
        }
      },
      builder: (context, paymentState) {
        final isLoading = paymentState is PaymentLoading;

        return BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            int amount = context.read<PaymentCubit>().amount;
            return CustomButton(
              onTap: isLoading
                  ? null
                  : () {
                      final selectedItems =
                          items ??
                          context.read<PaymentCubit>().items ??
                          cartState.items;

                      final transctions = getTransctionsData(
                        selectedItems,
                        totalAmount: amount,
                      );

                      var num = context.read<PaymentCubit>().paymentMethod;
                      switch (num) {
                        case 0:
                          paymentStripe(context, amount);
                        case 1:
                          paymentPaypal(context, transctions);
                        case 2:
                          paymentPaymob(context, amount, selectedItems);
                        case 3:
                          paymentPaytaps(context, amount);
                        case 4:
                          paymentKashier(context, amount.toString());
                      }
                    },
              text: 'Continue',
              isLoading: isLoading,
            );
          },
        );
      },
    );
  }
}
