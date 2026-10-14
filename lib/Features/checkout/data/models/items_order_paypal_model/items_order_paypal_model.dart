import 'package:payment_method/Features/checkout/data/models/items_order_paypal_model/item.dart';

class ItemsOrderPaypalModel {
  final List<ItemOrder>? items;

  ItemsOrderPaypalModel({this.items});

  factory ItemsOrderPaypalModel.fromJson(Map<String, dynamic> json) {
    return ItemsOrderPaypalModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemOrder.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (items != null) 'items': items!.map((e) => e.toJson()).toList(),
  };
}
