// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cart_bloc.dart';

class ProductCartState extends Equatable {
  final List<CartItem> productCart;
  const ProductCartState({
    required this.productCart,
  });

  factory ProductCartState.initial() => const ProductCartState(
        productCart: [],
      );

  @override
  List<Object> get props => [productCart];

  @override
  bool get stringify => true;

  ProductCartState copyWith({
    List<CartItem>? productCart,
  }) {
    return ProductCartState(
      productCart: productCart ?? this.productCart,
    );
  }
}
