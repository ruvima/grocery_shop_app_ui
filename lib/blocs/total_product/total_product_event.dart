// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'total_product_bloc.dart';

abstract class TotalProductEvent extends Equatable {
  const TotalProductEvent();

  @override
  List<Object> get props => [];
}

class CalculateTotalAmountEvent extends TotalProductEvent {
  final double totalAmount;
  const CalculateTotalAmountEvent({
    required this.totalAmount,
  });

  @override
  List<Object> get props => [totalAmount];
}

class CalculateProductQuantityEvent extends TotalProductEvent {
  final int productQuantity;
  const CalculateProductQuantityEvent({
    required this.productQuantity,
  });

  @override
  List<Object> get props => [productQuantity];
}
