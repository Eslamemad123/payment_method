import 'history.dart';
import 'payment_params.dart';

class ResponsePaymentKashierModel {
  String? merchantId;
  String? status;
  String? apiKey;
  num? failureAttempts;
  num? capturedAmount;
  num? refundedAmount;
  PaymentParams? paymentParams;
  List<History>? history;
  String? apmTraceId;
  bool? createdBySystem;
  String? id;
  List<dynamic>? webhookNotifications;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;
  String? sessionUrl;

  ResponsePaymentKashierModel({
    this.merchantId,
    this.status,
    this.apiKey,
    this.failureAttempts,
    this.capturedAmount,
    this.refundedAmount,
    this.paymentParams,
    this.history,
    this.apmTraceId,
    this.createdBySystem,
    this.id,
    this.webhookNotifications,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.sessionUrl,
  });

  factory ResponsePaymentKashierModel.fromJson(Map<String, dynamic> json) {
    return ResponsePaymentKashierModel(
      merchantId: json['merchantId']?.toString(),
      status: json['status']?.toString(),
      apiKey: json['apiKey']?.toString(),
      failureAttempts: num.tryParse(json['failureAttempts'].toString()),
      capturedAmount: num.tryParse(json['capturedAmount'].toString()),
      refundedAmount: num.tryParse(json['refundedAmount'].toString()),
      paymentParams: json['paymentParams'] == null
          ? null
          : PaymentParams.fromJson(
              Map<String, dynamic>.from(json['paymentParams']),
            ),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => History.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      apmTraceId: json['apmTraceId']?.toString(),
      createdBySystem: json['createdBySystem']?.toString().contains("true"),
      id: json['_id']?.toString(),
      webhookNotifications: List<dynamic>.from(
        json['webhookNotifications'] ?? [],
      ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'].toString()),
      v: num.tryParse(json['__v'].toString()),
      sessionUrl: json['sessionUrl']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (merchantId != null) 'merchantId': merchantId,
    if (status != null) 'status': status,
    if (apiKey != null) 'apiKey': apiKey,
    if (failureAttempts != null) 'failureAttempts': failureAttempts,
    if (capturedAmount != null) 'capturedAmount': capturedAmount,
    if (refundedAmount != null) 'refundedAmount': refundedAmount,
    if (paymentParams != null) 'paymentParams': paymentParams?.toJson(),
    if (history != null) 'history': history?.map((e) => e.toJson()).toList(),
    if (apmTraceId != null) 'apmTraceId': apmTraceId,
    if (createdBySystem != null) 'createdBySystem': createdBySystem,
    if (id != null) '_id': id,
    if (webhookNotifications != null)
      'webhookNotifications': webhookNotifications,
    if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
    if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
    if (v != null) '__v': v,
    if (sessionUrl != null) 'sessionUrl': sessionUrl,
  };
}
