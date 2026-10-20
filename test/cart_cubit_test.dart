import 'package:flutter_test/flutter_test.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/cart_screen/cubit/cart_cubit.dart';

void main() {
  late CartCubit cubit;

  setUp(() {
    cubit = CartCubit(initialItems: []);
  });

  tearDown(() {
    cubit.close();
  });

  group('CartCubit Tests', () {
    test('initial cart should be empty', () {
      expect(cubit.state.items, isEmpty);
    });

    test('decrement should do nothing for missing product', () {
      final initialState = cubit.state;

      cubit.decrement('unknown-product');

      expect(cubit.state, same(initialState));
    });

    test('increment should add item with quantity one', () {
      final item = createCartItem();

      cubit.increment(item);

      expect(cubit.state.items, hasLength(1));
      expect(cubit.state.items.first.quantity, 1);
    });

    test('increment should increase existing item quantity', () {
      final item = createCartItem();

      cubit.increment(item);
      cubit.increment(item);

      expect(cubit.state.items, hasLength(1));
      expect(cubit.state.items.first.quantity, 2);
    });

    test('decreme nt should reduce quantity when greater than one', () {
      final item = createCartItem();

      cubit.increment(item);
      cubit.increment(item);
      cubit.decrement(item.productId);

      expect(cubit.state.items, hasLength(1));
      expect(cubit.state.items.first.quantity, 1);
    });

    test('decrement should remove item when quantity reaches zero', () {
      final item = createCartItem();
      cubit.increment(item);

      cubit.decrement(item.productId);

      expect(cubit.state.items, isEmpty);
    });

    test('removeItem should remove the selected product', () {
      final item = createCartItem();
      cubit.increment(item);

      cubit.removeItem(item.productId);

      expect(cubit.state.items, isEmpty);
    });
  });
}

CartItemModel createCartItem() {
  return CartItemModel(
    productId: 'test-product',
    quantity: 1,
    name: '',
    price: 200,
    imageUrl: '',
  );
}
