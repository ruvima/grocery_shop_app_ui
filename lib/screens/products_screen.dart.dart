import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/total_product/total_product_bloc.dart';
import '../constants/constants.dart';
import '../widgets/cart_box.dart';
import '../widgets/fruits_box.dart';
import '../blocs/product_cart/product_cart_bloc.dart';
import '../blocs/product_list/product_list_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LocationHeaderWidget(),
            SizedBox(height: 20),
            _GreetingAndMessageWidget(),
            SizedBox(height: 10),
            _ProductListWidget(),
            _CartSummaryAndButtonWidget(),
            SizedBox(height: 10),
            _ShoppingCartListWidget(),
          ],
        ),
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
                return CartBox(
                  name: item.product.name,
                  subtotalPrice: item.subtotalPrice.toString(),
                  image: item.product.image,
                  quantity: item.quantity,
                  onTap: () {},
                );
              });
        },
      ),
    );
  }
}

class _CartSummaryAndButtonWidget extends StatelessWidget {
  const _CartSummaryAndButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(builder: (context) {
            final productQuantity =
                context.watch<TotalProductBloc>().state.productQuantity;
            return Text(
              productQuantity == 0
                  ? 'My orders'
                  : 'My orders: $productQuantity products',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            child: const Text(
              'Go to cart',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ProductListWidget extends StatelessWidget {
  const _ProductListWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return FruitsBox(
                name: product.name,
                price: ' ${product.price}',
                image: product.image,
                onTap: () {
                  context.read<ProductCartBloc>().add(
                        AddProductCartEvent(product: product),
                      );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _GreetingAndMessageWidget extends StatelessWidget {
  const _GreetingAndMessageWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Good morning, Mate',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(right: 100),
            child: const Text(
              "Let's order fresh items for you",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Buy fresh items',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationHeaderWidget extends StatelessWidget {
  const _LocationHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Text(
            'Sylhet, Bangladesh',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            backgroundImage: AssetImage(Constants.profile),
          ),
        ],
      ),
    );
  }
}
