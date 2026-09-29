import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/core/utils/api_keys.dart';
import 'package:payment_method/core/utils/api_services.dart';

class StripeService {
  final ApiServices apiService = ApiServices();

  Future<PaymentIntent> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymentIntent = PaymentIntent.fromJson(response.data);
    return paymentIntent;
  }

  Future initPaymentsheet({required String paymentrntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentrntentClientSecret,
        merchantDisplayName: 'Eslam',
      ),
    );
  }
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async{
    var paymentIntentModel=await createPaymentIntent(paymentIntentInputModel);
    await initPaymentsheet(paymentrntentClientSecret: paymentIntentModel.clientSecret);
    await displayPaymentSheet();
  }
}
