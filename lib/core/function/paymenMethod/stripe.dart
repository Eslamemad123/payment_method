import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/manger/cubit/stripe_payment_cubit.dart';

void paymentStripe(BuildContext context, int amount) {
  log('stripe');
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    currency: 'USD',
    amount: amount,
    idCustomer: 'cus_VMXVlJunz10SQJ',
  );
  BlocProvider.of<PaymentCubit>(context)
      .makePaymentStripe(paymentIntentInputModel: paymentIntentInputModel);
}
