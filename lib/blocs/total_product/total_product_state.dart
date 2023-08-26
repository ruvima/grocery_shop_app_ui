// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'total_product_bloc.dart';

class TotalProductState extends Equatable {
  final double totalAmount;
  final int productQuantity;
  const TotalProductState({
    required this.totalAmount,
    required this.productQuantity,
  });

  @override
  List<Object> get props => [totalAmount, productQuantity];

  @override
  bool get stringify => true;

  TotalProductState copyWith({
    double? totalAmount,
    int? productQuantity,
  }) {
    return TotalProductState(
      totalAmount: totalAmount ?? this.totalAmount,
      productQuantity: productQuantity ?? this.productQuantity,
    );
  }
}
