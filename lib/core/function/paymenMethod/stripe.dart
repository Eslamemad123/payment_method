import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';

void paymentStripe(BuildContext context) {
  log('stripe');
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    currency: 'USD',
    amount: 100,
    idCustomer: 'cus_VMXVlJunz10SQJ',
  );
  BlocProvider.of<StripePaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
