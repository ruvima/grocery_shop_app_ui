// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_products_bloc.dart';

abstract class FilteredProductsEvent extends Equatable {
  const FilteredProductsEvent();

  @override
  List<Object> get props => [];
}

class SetFilteredProductEvent extends FilteredProductsEvent {
  final List<Product> filteredProducts;
  const SetFilteredProductEvent({
    required this.filteredProducts,
  });

  @override
  List<Object> get props => [filteredProducts];
}
