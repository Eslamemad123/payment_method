import 'customer.dart';

class PaymentParams {
  num? amount;
  num? originalAmount;
  String? currency;
  String? order;
  String? merchantRedirect;
  bool? immediateRedirect;
  String? display;
  String? hash;
  String? storeName;
  String? store;
  String? allowedMethods;
  Customer? customer;
  bool? disableDiscount;

  PaymentParams({
    this.amount,
    this.originalAmount,
    this.currency,
    this.order,
    this.merchantRedirect,
    this.immediateRedirect,
    this.display,
    this.hash,
    this.storeName,
    this.store,
    this.allowedMethods,
    this.customer,
    this.disableDiscount,
  });

  factory PaymentParams.fromJson(Map<String, dynamic> json) => PaymentParams(
    amount: num.tryParse(json['amount'].toString()),
    originalAmount: num.tryParse(json['originalAmount'].toString()),
    currency: json['currency']?.toString(),
    order: json['order']?.toString(),
    merchantRedirect: json['merchantRedirect']?.toString(),
    immediateRedirect: json['immediateRedirect']?.toString().contains("true"),
    display: json['display']?.toString(),
    hash: json['hash']?.toString(),
    storeName: json['storeName']?.toString(),
    store: json['store']?.toString(),
    allowedMethods: json['allowedMethods']?.toString(),
    customer: json['customer'] == null
        ? null
        : Customer.fromJson(Map<String, dynamic>.from(json['customer'])),
    disableDiscount: json['disableDiscount']?.toString().contains("true"),
  );

  Map<String, dynamic> toJson() => {
    if (amount != null) 'amount': amount,
    if (originalAmount != null) 'originalAmount': originalAmount,
    if (currency != null) 'currency': currency,
    if (order != null) 'order': order,
    if (merchantRedirect != null) 'merchantRedirect': merchantRedirect,
    if (immediateRedirect != null) 'immediateRedirect': immediateRedirect,
    if (display != null) 'display': display,
    if (hash != null) 'hash': hash,
    if (storeName != null) 'storeName': storeName,
    if (store != null) 'store': store,
    if (allowedMethods != null) 'allowedMethods': allowedMethods,
    if (customer != null) 'customer': customer?.toJson(),
    if (disableDiscount != null) 'disableDiscount': disableDiscount,
  };
}
