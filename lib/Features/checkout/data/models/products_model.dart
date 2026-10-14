class ProductsModel {
  final List<String> image;
  final String name;
  final String subTitle;
  final String description;
  final int number;
  final double price;

  ProductsModel({
    required this.image,
    required this.name,
    required this.subTitle,
    required this.description,
    required this.number,
    required this.price,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      image: List<String>.from(json['image'] ?? []),
      name: json['name'] ?? '',
      subTitle: json['subTitle'] ?? '',
      description: json['description'] ?? '',
      number: json['number'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'subTitle': subTitle,
      'description': description,
      'number': number,
      'price': price,
    };
  }
}
