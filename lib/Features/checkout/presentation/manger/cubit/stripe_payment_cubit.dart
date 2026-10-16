import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';

part 'stripe_payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkPayment) : super(PaymentInitial());
  final CheckPaymentrepo checkPayment;
  int paymentMethod = 0;
  int amount = 0;
  List<CartItemModel>? items;

  Future makePaymentStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    var data = await checkPayment.mackPaymentStripe(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (left) {
        emit(PaymentFailer(errorMessage: left.toString()));
      },
      (right) {
        emit(PaymentSuccess());
      },
    );
  }

  Future makePaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  }) async {
    emit(PaymentLoading());
    log('loading');

    var data = await checkPayment.mackPaymentKashier(
      paymentIntentKashierModel: paymentIntentKashierModel,
    );

    data.fold(
      (left) {
        log('error');

        emit(PaymentFailer(errorMessage: left.toString()));
      },
      (right) {
        log('suc');

        emit(PaymentSuccess());
      },
    );
  }
}
