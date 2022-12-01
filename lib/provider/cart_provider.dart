import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grocery_shop_app_ui/models/item.dart';

class CartListState {
  final List<Item> items;

  CartListState({
    required this.items,
  });
  CartListState copyWith({
    List<Item>? items,
  }) {
    return CartListState(
      items: items ?? this.items,
    );
  }

  factory CartListState.initial() {
    return CartListState(
      items: [],
    );
  }

  @override
  String toString() => 'CartListState(items: $items)';
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartListState && listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

final cartProvider =
    StateNotifierProvider<CartListNotifier, CartListState>((_) {
  return CartListNotifier();
});

class CartListNotifier extends StateNotifier<CartListState> {
  CartListNotifier() : super(CartListState.initial());

  double _total = 0;

  double get total => _total;

  void addItem(Item item) {
    final newItems = [...state.items, item];

    state = state.copyWith(items: newItems);

    double sum = 0;

    for (var i = 0; i < state.items.length; i++) {
      sum += state.items[i].price;
    }
    _total = sum;
  }
}
