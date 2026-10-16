import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/customer.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';

void paymentKashier(BuildContext context, String amount) {
  log('kashier');
  Customer customer = Customer(
    email: 'ee7456482@gmail.com',
    reference: '123456789',
  );
  PaymentIntentKashierModel paymentIntentKashierModel =
      PaymentIntentKashierModel(
        amount: amount,
        currency: 'EGP',
        customer: customer,
        merchantId: 'MID-50958-986',
        merchantRedirect: 'https://kashier.io',
        order: 'ORDER-${DateTime.now().millisecondsSinceEpoch}',
      );
  BlocProvider.of<PaymentCubit>(context)
      .makePaymentKashier(paymentIntentKashierModel: paymentIntentKashierModel);
}
