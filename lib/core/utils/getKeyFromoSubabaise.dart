import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class PaymentBackend {
  static Future<String> getKey(String keyName) async {
    final response = await Supabase.instance.client.functions.invoke(
      'payment-backend',
      body: {'keyName': keyName},
    );

    log('Status: ${response.status}');
    log('Response: ${response.data}');

    if (response.status != 200) {
      throw Exception('Failed to get key: ${response.status}');
    }

    final data = response.data;

    if (data is! Map || data['value'] is! String) {
      throw Exception('The Function response does not contain a String value.');
    }
    log('${data['value']}');

    return data['value'] as String;
  }
}
