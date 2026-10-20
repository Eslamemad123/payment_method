import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_result_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';
import 'package:payment_method/core/error/faliers.dart';
import 'package:payment_method/core/utils/kashier_services.dart';
import 'package:payment_method/core/utils/paymob_services.dart';
import 'package:payment_method/core/utils/paytabs_services.dart';
import 'package:payment_method/core/utils/stripe_services.dart';

class CheckPaymentImplement extends CheckPaymentrepo {
  final StripeService stripeService;
  final KashierServices kashierServices;
  final PaytabsServices paytabsServices;
  final PaymobServices paymobServices;

  CheckPaymentImplement({
    StripeService? stripeService,
    KashierServices? kashierServices,
    PaytabsServices? paytabsServices,
    PaymobServices? paymobServices,
  })  : stripeService = stripeService ?? StripeService(),
        kashierServices = kashierServices ?? KashierServices(),
        paytabsServices = paytabsServices ?? PaytabsServices(),
        paymobServices = paymobServices ?? PaymobServices();

  @override
  Future<Either<Falier, void>> mackPaymentStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return Right(null);
    } on StripeException catch (e) {
      return Left(
        ServerFailer(errorMessage: e.error.message ?? 'oppos that is error '),
      );
    } catch (e) {
      return Left(ServerFailer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Falier, void>> mackPaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  }) async {
    try {
      await kashierServices.makePaymentKashier(
        paymentIntentKashierModel: paymentIntentKashierModel,
      );
      return Right(null);
    } catch (e) {
      log('Kashier Error: $e');
      return Left(ServerFailer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Falier, PaymentResultModel>> mackPaymentPayTaps({
    required int amount,
  }) async {
    try {
      final PaymentResultModel result =
          await paytabsServices.makePaymentPaytabs(amount: amount);

      if (result.isSuccess) {
        return Right(result);
      } else if (result.isCancelled) {
        return Left(
          CancelledFailer(
            errorMessage: result.message ?? 'Payment cancelled by user',
          ),
        );
      } else if (result.isPending) {
        return Left(
          PendingFailer(
            errorMessage: result.message ?? 'Payment is pending confirmation',
          ),
        );
      } else {
        return Left(
          ServerFailer(
            errorMessage: result.message ?? 'PayTabs payment failed',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Falier, PaymentResultModel>> mackPaymentPaymob({
    required int amount,
    required List<CartItemModel> items,
  }) async {
    try {
      final result = await paymobServices.mackPaymentPaymob(amount, items);

      if (result.isSuccessful) {
        return Right(
          PaymentResultModel.success(
            data: result.transactionDetails,
            message: 'Paymob payment is successful',
          ),
        );
      } else if (result.isCancelled) {
        return Left(
          CancelledFailer(errorMessage: 'Payment cancelled by user'),
        );
      } else if (result.isPending) {
        return Left(
          PendingFailer(errorMessage: 'Paymob payment is pending'),
        );
      } else {
        return Left(
          ServerFailer(
            errorMessage: result.errorMessage ?? 'Paymob payment failed',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailer(errorMessage: e.toString()));
    }
  }
}
