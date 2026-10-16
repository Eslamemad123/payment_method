import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/thank_you_view.dart';
import 'package:payment_method/core/function/getTransctionPaypal.dart';
import 'package:payment_method/core/function/paymenMethod/fawry.dart';
import 'package:payment_method/core/function/paymenMethod/googlePay.dart';
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
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
        } else if (state is PaymentFailer) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            int amount = context.read<PaymentCubit>().amount;
            return CustomButton(
              onTap: () {
                final selectedItems =
                    items ??
                    context.read<PaymentCubit>().items ??
                    context.read<CartCubit>().state.items;

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
                    PaymentPaymob(amount, selectedItems);
                  case 3:
                    paymentPayTaps(context, amount);
                  case 4:
                    paymentFawry();
                  case 5:
                    paymentKashier(context, amount.toString());
                  case 6:
                    paymentGooglePay();
                }
              },
              text: 'Continue',
              isLoading: (state is PaymentLoading) ? true : false,
            );
          },
        );
      },
    );
  }
}
