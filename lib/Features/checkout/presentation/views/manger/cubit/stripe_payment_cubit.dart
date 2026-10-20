import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';
import 'package:payment_method/core/error/faliers.dart';

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
    if (state is PaymentLoading) return;
    emit(PaymentLoading());

    var data = await checkPayment.mackPaymentStripe(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (left) {
        emit(PaymentFailer(errorMessage: left.errorMessage));
      },
      (right) {
        emit(PaymentSuccess(amount: amount.toString()));
      },
    );
  }

  Future makePaymentPayTaps({required int amount}) async {
    if (state is PaymentLoading) return;
    emit(PaymentLoading());

    try {
      var data = await checkPayment.mackPaymentPayTaps(amount: amount);

      data.fold(
        (failure) {
          if (failure is CancelledFailer) {
            emit(PaymentCancelled(message: failure.errorMessage));
          } else if (failure is PendingFailer) {
            emit(PaymentPending(message: failure.errorMessage));
          } else {
            emit(PaymentFailer(errorMessage: failure.errorMessage));
          }
        },
        (result) {
          emit(PaymentSuccess(amount: amount.toString()));
        },
      );
    } catch (e) {
      emit(PaymentFailer(errorMessage: e.toString()));
    }
  }

  Future<void> makePaymentPaymob({
    required int amount,
    required List<CartItemModel> items,
  }) async {
    if (state is PaymentLoading) return;
    emit(PaymentLoading());

    try {
      final data = await checkPayment.mackPaymentPaymob(
        amount: amount,
        items: items,
      );

      data.fold(
        (failure) {
          if (failure is CancelledFailer) {
            emit(PaymentCancelled(message: failure.errorMessage));
          } else if (failure is PendingFailer) {
            emit(PaymentPending(message: failure.errorMessage));
          } else {
            emit(PaymentFailer(errorMessage: failure.errorMessage));
          }
        },
        (result) {
          emit(PaymentSuccess(amount: amount.toString()));
        },
      );
    } catch (e) {
      emit(PaymentFailer(errorMessage: e.toString()));
    }
  }

  Future makePaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  }) async {
    if (state is PaymentLoading) return;
    emit(PaymentLoading());
    log('loading');

    var data = await checkPayment.mackPaymentKashier(
      paymentIntentKashierModel: paymentIntentKashierModel,
    );

    data.fold(
      (left) {
        log('error');
        emit(PaymentFailer(errorMessage: left.errorMessage));
      },
      (right) {
        log('suc');
        emit(PaymentSuccess(amount: amount.toString()));
      },
    );
  }
}
