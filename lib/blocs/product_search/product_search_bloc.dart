import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  ProductSearchBloc() : super(ProductSearchState.initial()) {
    on<SetSeatchTermEvent>(
      (event, emit) {
        emit(state.copyWith(searchTerm: event.searchTerm));
      },
      transformer: _debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<SetSeatchTermEvent> _debounce<SetSeatchTermEvent>(
          Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
