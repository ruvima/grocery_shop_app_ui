// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'product.dart';

class CartItem {
  final Product product;
  final double subtotalPrice;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 0,
    required this.subtotalPrice,
  });

  @override
  String toString() =>
      'CartItem(product: $product, subtotalPrice: $subtotalPrice, quantity: $quantity)';
}
