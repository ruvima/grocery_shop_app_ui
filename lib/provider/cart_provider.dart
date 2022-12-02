import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grocery_shop_app_ui/models/item.dart';

final cartProvider =
    ChangeNotifierProvider<CartListNotifier>((_) => CartListNotifier());

class CartListNotifier extends ChangeNotifier {
  double _total = 0;
  double get total => _total;

  List _cartList = [];
  List get cartList => _cartList;

  void addItem(Item item) {
    _cartList = [..._cartList, item];

    double sum = 0;

    for (var i = 0; i < _cartList.length; i++) {
      sum += _cartList[i].price;
    }
    _total = sum;
    notifyListeners();
  }

  void removeItem(int index) {
    _cartList.removeAt(index);
    notifyListeners();
  }
}

// class CartListState {
//   final List<Item> items;

//   CartListState({
//     required this.items,
//   });
//   CartListState copyWith({
//     List<Item>? items,
//   }) {
//     return CartListState(
//       items: items ?? this.items,
//     );
//   }

//   factory CartListState.initial() {
//     return CartListState(
//       items: [],
//     );
//   }

//   @override
//   String toString() => 'CartListState(items: $items)';
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is CartListState && listEquals(other.items, items);
//   }

//   @override
//   int get hashCode => items.hashCode;
// }

// final cartProvider = StateNotifierProvider((_) {
//   return CartListNotifier();
// });

// class CartListNotifier extends StateNotifier {
//   CartListNotifier() : super();

//   double _total = 0;

//   double get total => _total;

//   void addItem(Item item) {
//     final newItems = [...state.items, item];

//     state = state.copyWith(items: newItems);
//     //
//     double sum = 0;

//     for (var i = 0; i < state.items.length; i++) {
//       sum += state.items[i].price;
//     }
//     _total = sum;
//   }

//   void removeItem(int index) {
//     final newList = [state.items.removeAt(index)];

//     state.copyWith(
//         items: state.items.where((i) => i != state.items[index]).toList());
//   }
// }
