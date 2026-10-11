import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';

class CartState {
  final List<CartItemModel> items;
  final bool isLoading;
  final String? error;

  const CartState({this.items = const [], this.isLoading = false, this.error});

  int get itemsCount => items.fold<int>(0, (s, i) => s + i.quantity);
  double get subTotal => items.fold<double>(0, (s, i) => s + i.total);

  // كمية المنتج في الكارت (0 لو مش موجود)
  int quantityOf(String productId) {
    final i = items.indexWhere((e) => e.productId == productId);
    return i == -1 ? 0 : items[i].quantity;
  }

  CartState copyWith({
    List<CartItemModel>? items,
    bool? isLoading,
    String? error,
  }) => CartState(
    items: items ?? this.items,
    isLoading: isLoading ?? this.isLoading,
    error: error,
  );
}
