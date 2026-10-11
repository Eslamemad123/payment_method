import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/core/const/app_assets.dart';

final List<CartItemModel> cartItems = [
  CartItemModel(
    name: 'Horizon Wireless ANC',
    price: 249.0,
    imageUrl: AppAssets.headPhone,
    quantity: 2,
    productId: '2',
  ),
  CartItemModel(
    name: 'Nova Mechanical Keyboard',
    price: 139.0,
    imageUrl: AppAssets.keyboard,
    quantity: 1,
    productId: '1',
  ),
  CartItemModel(
    name: 'Aura Smartwatch Pro',
    price: 299.0,
    imageUrl: AppAssets.clock,
    quantity: 3,
    productId: '3',
  ),
];
