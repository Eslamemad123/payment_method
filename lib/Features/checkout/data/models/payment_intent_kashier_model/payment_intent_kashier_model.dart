import 'customer.dart';

class PaymentIntentKashierModel {
  String? amount;
  String? currency;
  String? merchantRedirect;
  String? merchantId;
  Customer? customer;
  String? order;

  PaymentIntentKashierModel({
    this.amount,
    this.currency,
    this.merchantRedirect,
    this.merchantId,
    this.customer,
    this.order,
  });

  factory PaymentIntentKashierModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentKashierModel(
      amount: json['amount']?.toString(),
      currency: json['currency']?.toString(),
      merchantRedirect: json['merchantRedirect']?.toString(),
      merchantId: json['merchantId']?.toString(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(Map<String, dynamic>.from(json['customer'])),
      order: json['order']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (amount != null) 'amount': amount,
    if (currency != null) 'currency': currency,
    if (merchantRedirect != null) 'merchantRedirect': merchantRedirect,
    if (merchantId != null) 'merchantId': merchantId,
    if (customer != null) 'customer': customer?.toJson(),
    if (order != null) 'order': order,
  };
}
