import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  ProductSearchBloc() : super(ProductSearchState.initial()) {
    on<SetSeatchTermEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.searchTerm));
    });
  }
}
