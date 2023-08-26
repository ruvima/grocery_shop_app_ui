import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../product_cart/product_cart_bloc.dart';

part 'total_product_event.dart';
part 'total_product_state.dart';

class TotalProductBloc extends Bloc<TotalProductEvent, TotalProductState> {
  late StreamSubscription _productCartSubscription;

  final ProductCartBloc _productCartBloc;

  TotalProductBloc(this._productCartBloc)
      : super(
          const TotalProductState(
            totalAmount: 0,
            productQuantity: 0,
          ),
        ) {
    _productCartSubscription = _productCartBloc.stream.listen((event) {
      final productQuantity = _productCartBloc.state.productCart
          .fold(0, (sum, product) => sum + product.quantity);

      final totalAmount = _productCartBloc.state.productCart
          .fold(0.0, (sum, product) => sum + product.subtotalPrice);

      add(CalculateProductQuantityEvent(productQuantity: productQuantity));
      add(CalculateTotalAmountEvent(totalAmount: totalAmount));
    });

    on<CalculateTotalAmountEvent>((event, emit) {
      emit(state.copyWith(totalAmount: event.totalAmount));
    });
    on<CalculateProductQuantityEvent>((event, emit) {
      emit(state.copyWith(productQuantity: event.productQuantity));
    });
  }

  @override
  Future<void> close() {
    _productCartSubscription.cancel();
    return super.close();
  }
}
