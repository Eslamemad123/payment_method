import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/core/const/app_assets.dart';

final List<CartItemModel> cartItems = [
  CartItemModel(
    title: 'Horizon Wireless ANC',
    price: 249.0,
    image: AppAssets.headPhone,
    quantity: 2,
  ),
  CartItemModel(
    title: 'Nova Mechanical Keyboard',
    price: 139.0,
    image: AppAssets.keyboard,
    quantity: 1,
  ),
  CartItemModel(
    title: 'Aura Smartwatch Pro',
    price: 299.0,
    image: AppAssets.clock,
    quantity: 3,
  ),
];
