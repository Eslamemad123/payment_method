import 'dart:async';
import 'dart:developer' show log;

import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:payment_method/Features/checkout/data/models/payment_result_model.dart';
import 'package:payment_method/core/utils/getKeyFromoSubabaise.dart';

class PaytabsServices {
  Future<PaymentSdkConfigurationDetails> initPayTaps(int amount) async {
    final clientKeyPayTaps = await PaymentBackend.getKey('clientKeyPayTaps');
    final serverKeyPayTaps = await PaymentBackend.getKey('serverKeyPayTaps');
    final profileIdPayTaps = await PaymentBackend.getKey('profileIdPayTaps');
    var billingDetails = BillingDetails(
      "abdelAzizi",
      "ee7456482@gmail.com",
      "01104796306",
      "cablat",
      "EG",
      "cairo",
      "EG",
      "12345e",
    );
    var configuration = PaymentSdkConfigurationDetails(
      profileId: profileIdPayTaps,
      serverKey: serverKeyPayTaps,
      clientKey: clientKeyPayTaps,
      cartId: 'CART-${DateTime.now().millisecondsSinceEpoch}',
      cartDescription: 'Payment for products',
      merchantName: "Es1am",
      screentTitle: "Pay with PayTabs",
      billingDetails: billingDetails,
      locale: PaymentSdkLocale.EN,
      amount: amount.toDouble(),
      currencyCode: "EGP",
      merchantCountryCode: "EG",
    );
    return configuration;
  }

  Future<PaymentResultModel> paymentPaytabs(
    PaymentSdkConfigurationDetails configuration,
  ) async {
    final completer = Completer<PaymentResultModel>();

    try {
      await FlutterPaytabsBridge.startCardPayment(configuration, (dynamic event) {
        log("PAYTABS EVENT => $event");

        if (event is! Map) {
          if (!completer.isCompleted) {
            completer.complete(
              PaymentResultModel.failure(
                message: 'Unexpected PayTabs response format',
              ),
            );
          }
          return;
        }

        final status = event["status"]?.toString().toLowerCase();

        if (status == "success") {
          final dynamic transactionData = event["data"];
          log("TRANSACTION DATA => $transactionData");

          if (transactionData is Map) {
            final dynamic isSuccessValue = transactionData["isSuccess"];
            final bool isSuccess = isSuccessValue == true ||
                isSuccessValue?.toString().toLowerCase() == "true";

            final dynamic isPendingValue = transactionData["isPending"];
            final dynamic isAuthorizedValue = transactionData["isAuthorized"];
            final bool isPending = isPendingValue == true ||
                isAuthorizedValue == true;

            final transactionRef =
                transactionData["transactionReference"]?.toString();
            final respMessage =
                transactionData["responseMessage"]?.toString() ??
                transactionData["respMessage"]?.toString();

            if (isSuccess) {
              if (!completer.isCompleted) {
                completer.complete(
                  PaymentResultModel.success(
                    transactionId: transactionRef,
                    message: respMessage ?? 'PayTabs transaction successful',
                    data: Map<String, dynamic>.from(transactionData),
                  ),
                );
              }
            } else if (isPending) {
              if (!completer.isCompleted) {
                completer.complete(
                  PaymentResultModel.pending(
                    transactionId: transactionRef,
                    message: respMessage ?? 'PayTabs payment is pending',
                    data: Map<String, dynamic>.from(transactionData),
                  ),
                );
              }
            } else {
              if (!completer.isCompleted) {
                completer.complete(
                  PaymentResultModel.failure(
                    message: respMessage ??
                        'PayTabs transaction was declined or failed',
                    data: Map<String, dynamic>.from(transactionData),
                  ),
                );
              }
            }
          } else {
            if (!completer.isCompleted) {
              completer.complete(
                PaymentResultModel.failure(
                  message: 'Missing transaction details in PayTabs response',
                ),
              );
            }
          }
        } else if (status == "event") {
          final message = event["message"]?.toString() ?? '';
          log("PAYTABS EVENT/CANCEL => $message");

          if (message.toLowerCase().contains("cancel")) {
            if (!completer.isCompleted) {
              completer.complete(
                PaymentResultModel.cancelled(
                  message: 'Payment cancelled by user',
                ),
              );
            }
          } else {
            if (!completer.isCompleted) {
              completer.complete(
                PaymentResultModel.failure(
                  message: message.isNotEmpty
                      ? message
                      : 'PayTabs event terminated transaction',
                ),
              );
            }
          }
        } else if (status == "error") {
          final message = event["message"]?.toString() ?? 'PayTabs error';
          log("PAYTABS ERROR => $message");
          if (!completer.isCompleted) {
            completer.complete(
              PaymentResultModel.failure(
                message: message,
              ),
            );
          }
        } else {
          log("PAYTABS UNKNOWN STATUS => $status");
          if (!completer.isCompleted) {
            completer.complete(
              PaymentResultModel.failure(
                message: 'Unknown status received from PayTabs: $status',
              ),
            );
          }
        }
      });
    } catch (e, stackTrace) {
      log('PayTabs bridge error: $e', stackTrace: stackTrace);
      if (!completer.isCompleted) {
        completer.complete(
          PaymentResultModel.failure(message: e.toString()),
        );
      }
    }

    return completer.future;
  }

  Future<PaymentResultModel> makePaymentPaytabs({required int amount}) async {
    var configuration = await initPayTaps(amount);
    return await paymentPaytabs(configuration);
  }
}
