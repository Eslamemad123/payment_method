import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/cart_screen/cubit/cart_state.dart';
import 'package:payment_method/core/const/cartItem.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({List<CartItemModel>? initialItems})
      : super(CartState(items: initialItems ?? cartItems));

  void increment(CartItemModel item) {
    final items = [...state.items];
    final i = items.indexWhere((e) => e.productId == item.productId);

    if (i == -1) {
      items.add(item.copyWith(quantity: 1)); // أول مرة: يتضاف بكمية 1
    } else {
      items[i] = items[i].copyWith(quantity: items[i].quantity + 1);
    }
    emit(state.copyWith(items: items));
  }

  void decrement(String productId) {
    final items = [...state.items];
    final i = items.indexWhere((e) => e.productId == productId);
    if (i == -1) return; // مش موجود، متعملش حاجة

    if (items[i].quantity <= 1) {
      items.removeAt(i); // وصل 0: يتشال
    } else {
      items[i] = items[i].copyWith(quantity: items[i].quantity - 1);
    }
    emit(state.copyWith(items: items));
  }

  void removeItem(String productId) {
    emit(
      state.copyWith(
        items: state.items.where((e) => e.productId != productId).toList(),
      ),
    );
  }
}
