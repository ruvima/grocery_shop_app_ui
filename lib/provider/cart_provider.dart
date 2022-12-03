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
  int _cartLengt = 0;

  double get total => _total;
  int get cartLengt => _cartLengt;

  void addItem(Item item) {
    final product = state.items;
    double totalPrice = _total;

    if (product.contains(item)) {
      final index = product.indexOf(item);
      product[index].count++;

      state = state.copyWith(items: product);
    } else {
      final newItems = [
        ...state.items,
        item.copyWith(count: 1),
      ];
      state = state.copyWith(items: newItems);
    }

    // //

    _cartLengt++;
    _total = totalPrice + item.price;
  }

  void removeItem(Item item) {
    final product = state.items;
    double totalPrice = _total;
    if (item.count > 1) {
      final index = product.indexOf(item);

      product[index].count--;
      state = state.copyWith(items: product);
    } else {
      product.remove(item);
      state = state.copyWith(items: product);
    }

    _cartLengt--;
    _total = totalPrice - item.price;
  }
}
