import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_method/Features/checkout/data/models/amount_paypal_model/amount_paypal_model.dart';
import 'package:payment_method/Features/checkout/data/models/items_order_paypal_model/items_order_paypal_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/thank_you_view.dart';
import 'package:payment_method/core/utils/api_keys.dart';

void paymentPaypal(
  BuildContext context,
  ({AmountPaypalModel amount, ItemsOrderPaypalModel items}) transctionsData,
) {
  log('paypal');
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientIdPaypal,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.items.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ThankYouView()),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else
                return false;
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        },
        onCancel: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        },
      ),
    ),
  );
}
