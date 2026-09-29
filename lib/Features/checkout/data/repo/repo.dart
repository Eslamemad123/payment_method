import 'package:dartz/dartz.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/core/error/faliers.dart';

abstract class CheckPaymentrepo {
  Future<Either<Falier, void>> mackPayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
