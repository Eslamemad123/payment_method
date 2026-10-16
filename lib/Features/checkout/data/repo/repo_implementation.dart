import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';
import 'package:payment_method/core/error/faliers.dart';
import 'package:payment_method/core/utils/kashier_services.dart';
import 'package:payment_method/core/utils/stripe_services.dart';

class CheckPaymentImplement extends CheckPaymentrepo {
  final StripeService stripeService = StripeService();
  final KashierServices kashierServices = KashierServices();
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
}
