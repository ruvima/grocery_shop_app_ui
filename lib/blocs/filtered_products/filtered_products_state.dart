part of 'filtered_products_bloc.dart';

class FilteredProductsState extends Equatable {
  final List<Product> filteredProducts;

  const FilteredProductsState({
    required this.filteredProducts,
  });

  @override
  List<Object> get props => [filteredProducts];

  FilteredProductsState copyWith({
    List<Product>? filteredProducts,
  }) {
    return FilteredProductsState(
      filteredProducts: filteredProducts ?? this.filteredProducts,
    );
  }

  @override
  bool get stringify => true;
}
