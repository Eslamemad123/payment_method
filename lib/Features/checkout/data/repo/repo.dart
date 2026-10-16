import 'package:dartz/dartz.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/core/error/faliers.dart';

abstract class CheckPaymentrepo {
  Future<Either<Falier, void>> mackPaymentStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
  Future<Either<Falier, void>> mackPaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  });
}
