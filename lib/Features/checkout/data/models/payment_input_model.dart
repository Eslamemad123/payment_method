class PaymentIntentInputModel {
  final String? currency;
  final int? amount;
  final String idCustomer;

  PaymentIntentInputModel({
    required this.currency,
    required this.amount,
    required this.idCustomer,
  });

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': idCustomer,
    };
  }
}
