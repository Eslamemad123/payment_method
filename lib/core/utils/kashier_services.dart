import 'dart:async';
import 'dart:developer';

import 'package:kashier_flutter_sdk/kashier_flutter_sdk.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/models/response_payment_kashier_model/response_payment_kashier_model.dart';
import 'package:payment_method/core/utils/api_services.dart';
import 'package:payment_method/core/utils/getKeyFromoSubabaise.dart';

class KashierServices {
  Future<void> initKashier() async {
    KashierSDK.initialize(mode: KashierMode.test, language: KashierLanguage.en);
  }

  Future<ResponsePaymentKashierModel> startSettionPaymentKashier(
    PaymentIntentKashierModel paymentIntentKashierModel,
  ) async {
    log('kashier');
    final ApiServices apiService = ApiServices();
    final secretKeyKashier = await PaymentBackend.getKey('secretKeyKashier');
    final ApiKeyKashier = await PaymentBackend.getKey('ApiKeyKashier');
    var response = await apiService.post(
      headers: {
        'Authorization': secretKeyKashier,
        'api-key': ApiKeyKashier,
        'Content-Type': 'application/json',
      },
      body: paymentIntentKashierModel.toJson(),
      url: 'https://test-api.kashier.io/v3/payment/sessions',
      token: secretKeyKashier,
    );
    dynamic sessionIdUrl = ResponsePaymentKashierModel.fromJson(response.data);
    return sessionIdUrl;
  }

  Future<KashierPaymentResult> paymentKashier({
    required String sessionId,
  }) async {
    log('Starting Kashier payment with sessionId: $sessionId');
    final completer = Completer<KashierPaymentResult>();

    try {
      await KashierSDK.startPayment(
        sessionId: sessionId,
        onSuccess: (KashierPaymentResult result) {
          log('Payment successful: ${result.transactionId}');
          if (!completer.isCompleted) {
            completer.complete(result);
          }
        },
        onPending: (KashierPaymentPending pending) {
          log('Payment pending: ${pending.orderId}');
          if (!completer.isCompleted) {
            completer.completeError(
              'Payment pending. Order ID: ${pending.orderId}',
            );
          }
        },
        onFailure: (KashierPaymentError error) {
          log('Payment failed: ${error.message} (code: ${error.code})');
          if (!completer.isCompleted) {
            if (error.code == KashierErrorCode.userCancelled) {
              completer.completeError('User cancelled payment');
            } else {
              completer.completeError(error.message);
            }
          }
        },
      );
    } catch (e, stackTrace) {
      log('Kashier error: $e', stackTrace: stackTrace);
      if (!completer.isCompleted) {
        completer.completeError(e.toString());
      }
    }

    return completer.future;
  }

  Future<KashierPaymentResult> makePaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  }) async {
    await initKashier();
    ResponsePaymentKashierModel sessionId = await startSettionPaymentKashier(
      paymentIntentKashierModel,
    );
    final id = sessionId.id;
    if (id == null || id.isEmpty) {
      throw Exception('Failed to get Kashier session ID');
    }
    log('Kashier Session ID: $id');
    return await paymentKashier(sessionId: id);
  }
}
