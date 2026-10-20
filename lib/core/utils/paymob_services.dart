import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paymob_sdk/flutter_paymob_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/core/utils/getKeyFromoSubabaise.dart';

class PaymobServices {
  Future<String> PaymentPaymob(int amount, List<CartItemModel> items) async {
    final secretKeypatmob = await PaymentBackend.getKey('secretKeypatmob');
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
        'Authorization': 'Token $secretKeypatmob',
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
    log(
      'key prefix: ${secretKeypatmob.substring(0, 12)}... len=${secretKeypatmob.length}',
    );
    log('status: ${response.statusCode}');
    log('body: ${response.body}');

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Paymob intention failed: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final clientSecret = data['client_secret'] as String?;

    if (clientSecret == null || clientSecret.isEmpty) {
      throw Exception('Paymob client secret is missing');
    }

    return clientSecret;
  }

  Future<PaymobPaymentResult> paymentPaymob(String clientSecret) async {
    if (clientSecret.isEmpty) {
      throw Exception('Paymob client secret is empty');
    }

    final publicKeyPaymob = await PaymentBackend.getKey('publicKeyPaymob');

    final paymobService = PaymobService();

    final result = await paymobService.payWithPaymob(
      publicKey: publicKeyPaymob,
      clientSecret: clientSecret,
      customization: const PaymobCustomization(
        appName: 'Flutter Payment Test',
        buttonBackgroundColor: Colors.blue,
        buttonTextColor: Colors.white,
        showSaveCard: true,
        saveCardDefault: false,
      ),
    );

    log('Paymob payment result status: ${result.status}');
    return result;
  }

  Future<PaymobPaymentResult> mackPaymentPaymob(
    int amount,
    List<CartItemModel> items,
  ) async {
    final String clientSecret = await PaymentPaymob(amount, items);
    return await paymentPaymob(clientSecret);
  }
}
