class PaymentIntentInputModel {


  final String? currency;
  final int? amount;

  PaymentIntentInputModel({
    required this.currency,
    required this.amount,
  });

  toJson() {
    return {
      'amount': amount, 
      'currency': currency,
    };
  }
}