part of 'product_search_bloc.dart';

abstract class ProductSearchEvent extends Equatable {
  const ProductSearchEvent();

  @override
  List<Object> get props => [];
}

class SetSeatchTermEvent extends ProductSearchEvent {
  final String searchTerm;
  const SetSeatchTermEvent({
    required this.searchTerm,
  });
  @override
  List<Object> get props => [searchTerm];
}
