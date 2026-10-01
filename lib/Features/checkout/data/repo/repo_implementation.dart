import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';
import 'package:payment_method/core/error/faliers.dart';
import 'package:payment_method/core/utils/stripe_services.dart';

class CheckPaymentImplement extends CheckPaymentrepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Falier, void>> mackPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return Right(null);
    } on Exception catch (e) {
       log('PAYMENT ERROR: $e');
  log('ERROR TYPE: ${e.runtimeType}');
  log('STACK TRACE: stackTrace');
      return Left(ServerFailer(errorMessage: e.toString()));
    }
  }
}
