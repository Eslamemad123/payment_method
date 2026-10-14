import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paymob_sdk/flutter_paymob_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/core/utils/api_keys.dart';

Future<void> PaymentPaymob(int amount, List<CartItemModel> items) async {
  final paymobItems = items
      .map(
        (e) => {
          'name': e.name,
          'amount': (e.price * 100).round(), // سعر الوحدة بالقروش
          'description': e.name, // مطلوب، ماينفعش يبقى فاضي
          'quantity': e.quantity,
        },
      )
      .toList();
  final response = await http.post(
    Uri.parse('https://accept.paymob.com/v1/intention/'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Token ${ApiKeys.secretKeypatmob}',
    },
    body: jsonEncode({
      'amount': amount * 100,
      'currency': 'EGP',
      'payment_methods': [5987169, 5930664],
      'items': paymobItems,
      'billing_data': {
        'first_name': 'John',
        'last_name': 'Doe',
        'email': 'customer@example.com',
        'phone_number': '+201000000000',
        'apartment': 'NA',
        'floor': 'NA',
        'street': 'NA',
        'building': 'NA',
        'shipping_method': 'NA',
        'postal_code': 'NA',
        'city': 'Cairo',
        'country': 'EG',
        'state': 'NA',
      },
    }),
  );

  log('status: ${response.statusCode}');
  log('body: ${response.body}');

  if (response.statusCode != 200 && response.statusCode != 201) return;

  final data = jsonDecode(response.body);
  final clientSecret = data['client_secret'] as String;

  debugPrint('Payment methods: ${data['payment_methods']}');
  paymentPaymob(clientSecret);
}

void paymentPaymob(String clientSecret) async {
  final paymobService = PaymobService();

  final result = await paymobService.payWithPaymob(
    publicKey: 'egy_pk_test_ZNwg32DESNimZR2QFI6GJFPsNvriFMq9',
    clientSecret: clientSecret,
    customization: PaymobCustomization(
      appName: 'Flutter Payment Test ',
      buttonBackgroundColor: Colors.blue,
      buttonTextColor: Colors.white,
      showSaveCard: true,
      saveCardDefault: false,
    ),
  );

  if (result.isSuccessful) {
    // Handle successful payment (transaction data is in result.transactionDetails)
  } else if (result.isFailure) {
    // Handle failed payment (the reason is in result.errorMessage)
  } else if (result.isPending) {
    // Handle pending payment status
  } else if (result.isCancelled) {
    // Handle pending payment status
  }
}
