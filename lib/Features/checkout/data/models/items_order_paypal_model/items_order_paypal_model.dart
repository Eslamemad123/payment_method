import 'item.dart';

class ItemsOrderPaypalModel {
  List<ItemOrder>? items;

  ItemsOrderPaypalModel({this.items});

  factory ItemsOrderPaypalModel.fromJson(Map<String, dynamic> json) {
    return ItemsOrderPaypalModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemOrder.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
  };
}
