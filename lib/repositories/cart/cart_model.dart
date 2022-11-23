import 'dart:convert';

import 'item_model.dart';

class FCart {
  const FCart([this.items = const <String, int>{}]);

  /// All the items in the cart, where:
  /// - key: food ID
  /// - value: quantity
  final Map<String, int> items;

  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        foodId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
    };
  }

  factory FCart.fromMap(Map<String, dynamic> map) {
    return FCart(
      Map<String, int>.from(
        (map['items']),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FCart.fromJson(String source) =>
      FCart.fromMap(json.decode(source) as Map<String, dynamic>);

  FCart copyWith({
    Map<String, int>? items,
  }) {
    return FCart(
      items ?? this.items,
    );
  }
}
