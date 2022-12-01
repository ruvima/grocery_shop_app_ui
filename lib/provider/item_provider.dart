import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_shop_app_ui/constants/constants.dart';

import 'package:grocery_shop_app_ui/models/item.dart';

class ItemsListState {
  final List<Item> items;
  ItemsListState({
    required this.items,
  });

  factory ItemsListState.initial() {
    return ItemsListState(
      items: [
        Item(
          name: 'Apple',
          price: 6.0,
          image: Constants.apple,
          color: Colors.red.shade50,
        ),
        Item(
          name: 'Avocado',
          price: 16.0,
          image: Constants.avocado,
          color: Colors.green.shade50,
        ),
        Item(
          name: 'Orange',
          price: 9.0,
          image: Constants.orange,
          color: Colors.orange.shade50,
        ),
        Item(
          name: 'Strawberry',
          price: 5.0,
          image: Constants.strawberry,
          color: Colors.red.shade100,
        ),
      ],
    );
  }
  ItemsListState copyWith({
    List<Item>? items,
  }) {
    return ItemsListState(
      items: items ?? this.items,
    );
  }

  @override
  String toString() => 'ItemsListState(items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemsListState && listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

final itemsProvider = StateNotifierProvider<ItemListNotifier, ItemsListState>(
  (_) => ItemListNotifier(),
);

class ItemListNotifier extends StateNotifier<ItemsListState> {
  ItemListNotifier() : super(ItemsListState.initial());
}
