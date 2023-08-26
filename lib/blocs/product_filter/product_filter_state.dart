// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_filter_bloc.dart';

enum Filter {
  all,
  fruits,
  vegetables,
}

class ProductFilterState extends Equatable {
  final Filter filter;
  const ProductFilterState({
    required this.filter,
  });
  factory ProductFilterState.initial() =>
      const ProductFilterState(filter: Filter.all);

  @override
  List<Object> get props => [filter];

  ProductFilterState copyWith({
    Filter? filter,
  }) {
    return ProductFilterState(
      filter: filter ?? this.filter,
    );
  }

  @override
  bool get stringify => true;
}
