import 'package:payment_method/Features/checkout/data/models/amount_paypal_model/amount_paypal_model.dart';
import 'package:payment_method/Features/checkout/data/models/amount_paypal_model/details.dart';
import 'package:payment_method/Features/checkout/data/models/items_order_paypal_model/item.dart';
import 'package:payment_method/Features/checkout/data/models/items_order_paypal_model/items_order_paypal_model.dart';

({AmountPaypalModel amount, ItemsOrderPaypalModel items}) getTransctionsData() {
  Details detailsAmount = Details(
    shipping: '0',
    shippingDiscount: 0,
    subtotal: '70',
  );
  AmountPaypalModel amount = AmountPaypalModel(
    currency: 'USD',
    details: detailsAmount,
    total: '70',
  );
  List<ItemOrder> items = [
    ItemOrder(currency: 'USD', name: 'Apple', price: '5', quantity: 4),
    ItemOrder(currency: 'USD', name: 'Pineapple', price: '10', quantity: 5),
  ];
  ItemsOrderPaypalModel itemsOrder = ItemsOrderPaypalModel(items: items);
  return (amount: amount, items: itemsOrder);
}
