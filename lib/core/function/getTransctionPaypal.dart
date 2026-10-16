import 'package:payment_method/Features/checkout/data/models/amount_paypal_model/amount_paypal_model.dart';
import 'package:payment_method/Features/checkout/data/models/amount_paypal_model/details.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/models/items_order_paypal_model/item.dart';
import 'package:payment_method/Features/checkout/data/models/items_order_paypal_model/items_order_paypal_model.dart';

({AmountPaypalModel amount, ItemsOrderPaypalModel items}) getTransctionsData(
  List<CartItemModel> cartItems, {
  num? totalAmount,
  double shipping = 0.0,
  num shippingDiscount = 0,
  String currency = 'USD',
}) {
  // حساب subtotal تلقائيًا من مجموع حاصل ضرب سعر كل منتج في كميته
  final double subtotal = cartItems.fold<double>(
    0.0,
    (sum, item) => sum + item.total,
  );

  // حساب total ليتوافق مع مجموع المنتجات والشحن والخصومات
  final double total =
      totalAmount != null &&
          shipping == 0 &&
          shippingDiscount == 0 &&
          (totalAmount.toDouble() - subtotal).abs() < 1
      ? totalAmount.toDouble()
      : (subtotal + shipping - shippingDiscount);

  final detailsAmount = Details(
    subtotal: subtotal.toStringAsFixed(2),
    shipping: shipping == 0 ? '0' : shipping.toStringAsFixed(2),
    shippingDiscount: shippingDiscount,
  );

  final amountModel = AmountPaypalModel(
    currency: currency,
    details: detailsAmount,
    total: total.toStringAsFixed(2),
  );

  // تحويل كل CartItemModel إلى ItemOrder المتوافق مع PayPal
  final itemsList = cartItems.map((cartItem) {
    return ItemOrder(
      name: cartItem.name,
      price: cartItem.price.toStringAsFixed(2),
      quantity: cartItem.quantity,
      currency: currency,
    );
  }).toList();

  final itemsOrder = ItemsOrderPaypalModel(items: itemsList);

  return (amount: amountModel, items: itemsOrder);
}

/// دالة مساعدة لتجهيز بيانات معاملة PayPal لمنتج واحد فقط
({AmountPaypalModel amount, ItemsOrderPaypalModel items})
getSingleItemTransactionData(
  CartItemModel singleItem, {
  num? totalAmount,
  double shipping = 0.0,
  num shippingDiscount = 0,
  String currency = 'USD',
}) {
  return getTransctionsData(
    [singleItem],
    totalAmount: totalAmount,
    shipping: shipping,
    shippingDiscount: shippingDiscount,
    currency: currency,
  );
}
