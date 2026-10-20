import 'package:dartz/dartz.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_result_model.dart';
import 'package:payment_method/core/error/faliers.dart';

abstract class CheckPaymentrepo {
  Future<Either<Falier, void>> mackPaymentStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
  Future<Either<Falier, void>> mackPaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  });
  Future<Either<Falier, PaymentResultModel>> mackPaymentPaymob({
    required int amount,
    required List<CartItemModel> items,
  });
  Future<Either<Falier, PaymentResultModel>> mackPaymentPayTaps({
    required int amount,
  });
}
