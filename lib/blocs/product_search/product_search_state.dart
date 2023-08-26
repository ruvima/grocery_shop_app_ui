part of 'product_search_bloc.dart';

class ProductSearchState extends Equatable {
  final String searchTerm;
  const ProductSearchState({required this.searchTerm});

  factory ProductSearchState.initial() =>
      const ProductSearchState(searchTerm: '');

  @override
  List<Object> get props => [searchTerm];

  ProductSearchState copyWith({
    String? searchTerm,
  }) {
    return ProductSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  bool get stringify => true;
}
