import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_method/Features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_model/payment_method_intent.dart';
import 'package:payment_method/core/utils/api_keys.dart';
import 'package:payment_method/core/utils/api_services.dart';

class StripeService {
  final ApiServices apiService = ApiServices();

  Future<PaymentMethodIntent> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contanType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKeyStripe,
    );
    var paymentIntent = PaymentMethodIntent.fromJson(response.data);
    return paymentIntent;
  }

  Future initPaymentsheet({
    required InitPaymentSheetInputModel initPaymentSheet,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheet.ClientSecret,
        customerId: initPaymentSheet.idCustomer,
        customerEphemeralKeySecret: initPaymentSheet.ephemeralkey,
        merchantDisplayName: 'Eslam',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralkey = await createEphemeralKey(
      idCustomer: paymentIntentInputModel.idCustomer,
    );

    var initPaymentSheet = InitPaymentSheetInputModel(
      ClientSecret: paymentIntentModel.clientSecret!,
      ephemeralkey: ephemeralkey.secret!,
      idCustomer: paymentIntentInputModel.idCustomer,
    );
    await initPaymentsheet(initPaymentSheet: initPaymentSheet);
    await displayPaymentSheet();
  }

  //---------------------------- s EphemeralKey ------------

  Future<EphemeralKeyModel> createEphemeralKey({
    required String idCustomer,
  }) async {
    var response = await apiService.post(
      contanType: Headers.formUrlEncodedContentType,
      body: {'customer': idCustomer},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKeyStripe,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKeyStripe}",
        'Stripe-Version': '2026-08-26.dahlia',
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
