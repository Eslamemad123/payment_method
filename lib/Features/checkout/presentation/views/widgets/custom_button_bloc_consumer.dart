import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
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
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
        } else if (state is StripePaymentFailer) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            var transctions = getTransctionsData();
            var num = context.read<StripePaymentCubit>().paymentMethod;
            switch (num) {
              case 0:
                paymentStripe(context);
              case 1:
                paymentPaypal(context, transctions);
              case 2:
                paymentPaymob();
              case 3:
                paymentPayTaps(context);
              case 4:
                paymentFawry();
              case 5:
                paymentKashier();
              case 6:
                paymentGooglePay();
            }
          },
          text: 'Continue',
          isLoading: (state is StripePaymentLoading) ? true : false,
        );
      },
    );
  }
}
