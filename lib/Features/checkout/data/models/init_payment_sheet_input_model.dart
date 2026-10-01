class InitPaymentSheetInputModel {
  final String ClientSecret;
  final String idCustomer;
  final String ephemeralkey;

  InitPaymentSheetInputModel({
    required this.ClientSecret,
    required this.idCustomer,
    required this.ephemeralkey,
  });
}
