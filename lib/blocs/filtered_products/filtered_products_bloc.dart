import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product.dart';
import '../product_filter/product_filter_bloc.dart';
import '../product_list/product_list_bloc.dart';
import '../product_search/product_search_bloc.dart';

part 'filtered_products_event.dart';
part 'filtered_products_state.dart';

class FilteredProductsBloc
    extends Bloc<FilteredProductsEvent, FilteredProductsState> {
  late StreamSubscription _productFilterSubscription;
  late StreamSubscription _productSearchSubscription;

  final ProductListBloc _productListBloc;
  final ProductSearchBloc _productSearchBloc;
  final ProductFilterBloc _productFilterBloc;
  FilteredProductsBloc({
    required ProductListBloc productListBloc,
    required ProductSearchBloc productSearchBloc,
    required ProductFilterBloc productFilterBloc,
  })  : _productListBloc = productListBloc,
        _productFilterBloc = productFilterBloc,
        _productSearchBloc = productSearchBloc,
        super(
          const FilteredProductsState(
            filteredProducts: [],
          ),
        ) {
    _productFilterSubscription = _productFilterBloc.stream.listen((event) {
      _setFilteredProducts();
    });
    _productSearchSubscription = _productSearchBloc.stream.listen((event) {
      _setFilteredProducts();
    });

    on<SetFilteredProductEvent>((event, emit) {
      emit(state.copyWith(filteredProducts: event.filteredProducts));
    });

    init();
  }

  void init() {
    final initialList = _productListBloc.state.products;
    add(SetFilteredProductEvent(filteredProducts: initialList));
  }

  List<Product> _filterProduct(Filter filter, List<Product> products) {
    if (filter == Filter.fruits) {
      return products.where((product) => product.category == 'fruits').toList();
    } else if (filter == Filter.vegetables) {
      return products
          .where((product) => product.category == 'vegetables')
          .toList();
    } else {
      return products;
    }
  }

  List<Product> _searchProduct(String searchTerm, List<Product> products) {
    if (products.isNotEmpty) {
      return products
          .where(
            (product) => product.name.toLowerCase().contains(
                  searchTerm.toLowerCase(),
                ),
          )
          .toList();
    }
    return products;
  }

  void _setFilteredProducts() {
    final products = _productListBloc.state.products;

    final filterProductList =
        _filterProduct(_productFilterBloc.state.filter, products);

    final resultList =
        _searchProduct(_productSearchBloc.state.searchTerm, filterProductList);

    add(SetFilteredProductEvent(filteredProducts: resultList));
  }

  @override
  Future<void> close() {
    _productFilterSubscription.cancel();
    _productSearchSubscription.cancel();
    return super.close();
  }
}
