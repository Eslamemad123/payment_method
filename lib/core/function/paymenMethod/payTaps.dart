import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/thank_you_view.dart';
import 'package:payment_method/core/utils/api_keys.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';

void paymentPayTaps(BuildContext context, int amount) {
  log('payTaps');
  var billingDetails = new BillingDetails(
    "abdelAzizi",
    "ee7456482@gmail.com",
    "01104796306",
    "cablat",
    "EG",
    "cairo",
    "ُEG",
    "12345e",
  );
  var configuration = PaymentSdkConfigurationDetails(
    profileId: ApiKeys.profileIdPayTaps,
    serverKey: ApiKeys.serverKeyPayTaps,
    clientKey: ApiKeys.clientKeyPayTaps,
    cartId: 'IOR:20350',
    cartDescription: 'Payment for products',
    merchantName: "Es1am",
    screentTitle: "Pay with payTaps for app flutter test",
    billingDetails: billingDetails,
    locale: PaymentSdkLocale.EN, //PaymentSdkLocale.AR, PaymentSdkLocale.FR, PaymentSdkLocale.TR, PaymentSdkLocale.UR or PaymentSdkLocale.DEFAULT.
    amount: amount.toDouble(),
    currencyCode: "EGP",
    merchantCountryCode: "EG",
  );
  FlutterPaytabsBridge.startCardPayment(configuration, (event) {
    log("PAYTABS EVENT => $event");

    if (event["status"] == "success") {
      final transactionDetails = event["data"];

      log("TRANSACTION => $transactionDetails");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThankYouView()),
      );

      if (transactionDetails["isSuccess"] == true) {
        log("successful transaction");
      } else {
        log("failed transaction");
      }
    } else if (event["status"] == "error") {
      log("PAYTABS ERROR => $event");
    } else if (event["status"] == "event") {
      log("PAYTABS EVENT => $event");
    }
  });
}
