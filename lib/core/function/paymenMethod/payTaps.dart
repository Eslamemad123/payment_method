import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/presentation/views/manger/cubit/stripe_payment_cubit.dart';

void paymentPaytaps(BuildContext context, int amount) {
  BlocProvider.of<PaymentCubit>(context).makePaymentPayTaps(amount: amount);
}
