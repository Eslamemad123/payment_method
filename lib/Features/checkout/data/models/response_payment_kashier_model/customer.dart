class Customer {
  String? email;
  String? reference;

  Customer({this.email, this.reference});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    email: json['email']?.toString(),
    reference: json['reference']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (email != null) 'email': email,
    if (reference != null) 'reference': reference,
  };
}
