part of 'product_filter_bloc.dart';

abstract class ProductFilterEvent extends Equatable {
  const ProductFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends ProductFilterEvent {
  final Filter filter;
  const ChangeFilterEvent({
    required this.filter,
  });
  @override
  List<Object> get props => [filter];
}
