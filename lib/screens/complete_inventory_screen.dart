import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/filtered_products/filtered_products_bloc.dart';
import '../blocs/product_cart/product_cart_bloc.dart';
import '../blocs/product_filter/product_filter_bloc.dart';
import '../blocs/product_search/product_search_bloc.dart';
import '../blocs/total_product/total_product_bloc.dart';
import '../widgets/fruits_box.dart';

class CompleteInventoryScreen extends StatelessWidget {
  const CompleteInventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          decoration: const InputDecoration(
            label: Text('Search product'),
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? searchTerm) {
            if (searchTerm != null) {
              context.read<ProductSearchBloc>().add(
                    SetSeatchTermEvent(searchTerm: searchTerm),
                  );
            }
          },
        ),
        actions: const [
          _SummaryWidget(),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
            ),
            child: Column(
              children: [
                _FilterProduct(),
                SizedBox(height: 10),
                _ProductListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Builder(builder: (context) {
        final total = context.watch<TotalProductBloc>().state;
        return Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Text(
                '\$${total.totalAmount}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  '${total.productQuantity}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _FilterProduct extends StatelessWidget {
  const _FilterProduct();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _FilterButton(filter: Filter.all),
          _FilterButton(filter: Filter.fruits),
          _FilterButton(filter: Filter.vegetables),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final Filter filter;
  const _FilterButton({
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<ProductFilterBloc>().add(
              ChangeFilterEvent(filter: filter),
            );
      },
      child: Builder(
        builder: (context) {
          final filterState = context.watch<ProductFilterBloc>().state.filter;
          return Text(
            filter == Filter.all
                ? 'All'
                : filter == Filter.fruits
                    ? 'Fruits'
                    : 'Vegetables',
            style: TextStyle(
              fontSize: 18,
              color:
                  filter == filterState ? Colors.deepPurpleAccent : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class _ProductListWidget extends StatelessWidget {
  const _ProductListWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredProductsBloc, FilteredProductsState>(
      builder: (context, state) {
        return GridView.builder(
          primary: false,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 2.4,
            crossAxisCount: 3,
          ),
          padding: const EdgeInsets.only(left: 15),
          itemCount: state.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = state.filteredProducts[index];
            return FruitsBox(
              name: product.name,
              price: ' ${product.price}',
              image: product.image,
              color: product.category == 'fruits'
                  ? const Color(0xFFEFFFDD)
                  : const Color(0XFFFFF0DA),
              onTap: () {
                context.read<ProductCartBloc>().add(
                      AddProductCartEvent(product: product),
                    );
              },
            );
          },
        );
      },
    );
  }
}
