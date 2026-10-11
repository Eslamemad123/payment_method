class CartItemModel {
  final String productId;
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;

  const CartItemModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get total => price * quantity;

  CartItemModel copyWith({int? quantity}) => CartItemModel(
    productId: productId,
    name: name,
    price: price,
    imageUrl: imageUrl,
    quantity: quantity ?? this.quantity,
  );
}
