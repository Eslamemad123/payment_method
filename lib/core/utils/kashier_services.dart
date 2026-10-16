import 'dart:developer';

import 'package:kashier_flutter_sdk/kashier_flutter_sdk.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/models/response_payment_kashier_model/response_payment_kashier_model.dart';
import 'package:payment_method/core/utils/api_keys.dart';
import 'package:payment_method/core/utils/api_services.dart';

class KashierServices {
  Future<void> initKashier() async {
    KashierSDK.initialize(mode: KashierMode.test, language: KashierLanguage.en);
  }

  Future<ResponsePaymentKashierModel> startSettionPaymentKashier(
    PaymentIntentKashierModel paymentIntentKashierModel,
  ) async {
    final ApiServices apiService = ApiServices();
    var response = await apiService.post(
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKeyKashier}',
        'api-key': ApiKeys.ApiKeyKashier,
        'Content-Type': 'application/json',
      },
      body: paymentIntentKashierModel.toJson(),
      url: 'https://test-api.kashier.io/v3/payment/sessions',
      token: ApiKeys.secretKeyKashier,
    );
    dynamic sessionIdUrl = ResponsePaymentKashierModel.fromJson(response.data);
    return sessionIdUrl;
  }

  Future<void> paymentKashier({required String sessionId}) async {
    log('Starting Kashier payment');

    try {
      // Initialize Kashier before starting payment

      await KashierSDK.startPayment(
        sessionId: sessionId,
        onSuccess: (KashierPaymentResult result) {
          log('Payment successful');
          log('Transaction ID: ${result.transactionId}');
          log('Status: ${result.status}');
        },
        onPending: (KashierPaymentPending pending) {
          log('Payment pending');
          log('Order ID: ${pending.orderId}');
        },
        onFailure: (KashierPaymentError error) {
          if (error.code == KashierErrorCode.userCancelled) {
            log('User cancelled payment');
            return;
          }

          log('Payment failed: ${error.message}');
          log('Error code: ${error.code}');
        },
      );
    } catch (e, stackTrace) {
      log('Kashier error: $e', stackTrace: stackTrace);
    }
  }

  Future makePaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  }) async {
    initKashier();
    ResponsePaymentKashierModel sessionId = await startSettionPaymentKashier(
      paymentIntentKashierModel,
    );
    paymentKashier(sessionId: sessionId.sessionUrl ?? '');
  }
}
