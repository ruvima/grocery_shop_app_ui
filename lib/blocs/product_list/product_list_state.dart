part of 'product_list_bloc.dart';

class ProductListState extends Equatable {
  final List<Product> products;
  const ProductListState({required this.products});

  factory ProductListState.initial() {
    return const ProductListState(
      products: [
        Product(
          id: '1',
          name: 'Apple',
          price: 12.0,
          image: 'assets/apple.png',
        ),
        Product(
          id: '2',
          name: 'Avocado',
          price: 20.0,
          image: 'assets/avocado.png',
        ),
        Product(
          id: '3',
          name: 'Orange',
          price: 11.5,
          image: 'assets/orange.png',
        ),
        Product(
          id: '4',
          name: 'Strawberry',
          price: 7.5,
          image: 'assets/strawberry.png',
        ),
      ],
    );
  }

  @override
  List<Object> get props => [products];

  ProductListState copyWith({
    List<Product>? products,
  }) {
    return ProductListState(
      products: products ?? this.products,
    );
  }

  @override
  bool get stringify => true;
}
