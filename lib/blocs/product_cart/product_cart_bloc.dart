import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';

part 'product_cart_event.dart';
part 'product_cart_state.dart';

class ProductCartBloc extends Bloc<ProductCartEvent, ProductCartState> {
  ProductCartBloc() : super(ProductCartState.initial()) {
    on<AddProductCartEvent>(_addProduct);
    on<RemoveProductCartEvent>(_removeProduct);
    on<ClearProductCartEvent>(_clearProductCard);
  }

  void _addProduct(AddProductCartEvent event, Emitter emit) {
    final hasProduct =
        state.productCart.any((item) => item.product.id == event.product.id);

    if (hasProduct) {
      final updatedProducts = state.productCart.map(
        (item) {
          return item.product.id == event.product.id
              ? CartItem(
                  product: item.product,
                  subtotalPrice: item.subtotalPrice + event.product.price,
                  quantity: item.quantity + 1,
                )
              : item;
        },
      ).toList();

      emit(state.copyWith(productCart: updatedProducts));
    } else {
      final newProduct = CartItem(
        product: event.product,
        subtotalPrice: event.product.price,
        quantity: 1,
      );
      final productCart = [...state.productCart, newProduct];
      emit(state.copyWith(productCart: productCart));
    }
  }

  void _removeProduct(RemoveProductCartEvent event, Emitter emit) {
    if (event.cartItem.quantity > 0) {
      // final index = _productListBloc.state.products
      //     .indexWhere((product) => product.id == event.cartItem.product.id);
      // final originalProduct = _productListBloc.state.products[index];
      final updatedProducts = state.productCart
          .map(
            (item) => item.product.id == event.cartItem.product.id
                ? CartItem(
                    product: item.product,
                    subtotalPrice:
                        item.subtotalPrice - event.cartItem.product.price,
                    quantity: item.quantity - 1,
                  )
                : item,
          )
          .toList();

      final checkProduct = updatedProducts
          .where(
            (element) => element.quantity != 0,
          )
          .toList();

      emit(state.copyWith(productCart: checkProduct));
    }
  }

  void _clearProductCard(ClearProductCartEvent event, Emitter emit) {
    emit(state.copyWith(productCart: []));
  }
}
