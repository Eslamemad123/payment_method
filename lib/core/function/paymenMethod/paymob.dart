import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/manger/cubit/stripe_payment_cubit.dart';

void paymentPaymob(
  BuildContext context,
  int amount,
  List<CartItemModel> items,
) {
  BlocProvider.of<PaymentCubit>(context)
      .makePaymentPaymob(amount: amount, items: items);
}
