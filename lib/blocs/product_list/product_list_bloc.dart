import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListState.initial()) {
    on<ProductListEvent>((event, emit) {});
  }
}
