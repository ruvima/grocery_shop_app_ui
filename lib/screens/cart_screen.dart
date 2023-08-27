import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/product_cart/product_cart_bloc.dart';
import '../blocs/total_product/total_product_bloc.dart';
import '../widgets/cart_box.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Column(
            children: [
              _CartTitleWidget(),
              _ShoppingCartListWidget(),
              SizedBox(height: 20),
              _PaymentSummaryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentSummaryWidget extends StatelessWidget {
  const _PaymentSummaryWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.indigo.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<TotalProductBloc, TotalProductState>(
            builder: (context, state) {
          return state.productQuantity == 0
              ? const Center(
                  child: Text(
                    'Your cart is empty. 😔',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Total amount',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade100,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$ ${state.totalAmount} total',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${state.productQuantity} products',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        elevation: 0,
                        backgroundColor: Colors.indigo.shade300,
                        minimumSize: const Size(50, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pay Now'),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}

class _ShoppingCartListWidget extends StatelessWidget {
  const _ShoppingCartListWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductCartBloc, ProductCartState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.productCart.length,
            itemBuilder: (context, index) {
              final item = state.productCart[index];
              return state.productCart.isNotEmpty
                  ? CartBox(
                      name: item.product.name,
                      subtotalPrice: item.subtotalPrice.toString(),
                      image: item.product.image,
                      quantity: item.quantity,
                      color: item.product.category == 'fruits'
                          ? const Color(0xFFEFFFDD)
                          : const Color(0XFFFFF0DA),
                      show: true,
                      onTap: () {
                        context.read<ProductCartBloc>().add(
                              RemoveProductCartEvent(
                                cartItem: item,
                              ),
                            );
                      },
                    )
                  : const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}

class _CartTitleWidget extends StatelessWidget {
  const _CartTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'My cart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Builder(
          builder: (context) {
            final productCart =
                context.watch<ProductCartBloc>().state.productCart;
            return productCart.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Clear all products'),
                              content: const Text('Are you sure?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('CANCEL'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<ProductCartBloc>().add(
                                          ClearProductCartEvent(),
                                        );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('YES'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Clear Cart',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
