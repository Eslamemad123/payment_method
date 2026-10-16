class History {
  String? status;
  DateTime? date;

  History({this.status, this.date});

  factory History.fromJson(Map<String, dynamic> json) => History(
    status: json['status']?.toString(),
    date: json['date'] == null
        ? null
        : DateTime.tryParse(json['date'].toString()),
  );

  Map<String, dynamic> toJson() => {
    if (status != null) 'status': status,
    if (date != null) 'date': date?.toIso8601String(),
  };
}
