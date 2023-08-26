// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cart_bloc.dart';

abstract class ProductCartEvent extends Equatable {
  const ProductCartEvent();

  @override
  List<Object> get props => [];
}

class AddProductCartEvent extends ProductCartEvent {
  final Product product;
  const AddProductCartEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class RemoveProductCartEvent extends ProductCartEvent {
  final CartItem cartItem;
  const RemoveProductCartEvent({
    required this.cartItem,
  });
  @override
  List<Object> get props => [cartItem];
}

class ClearProductCartEvent extends ProductCartEvent {}
