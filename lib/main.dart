import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/filtered_products/filtered_products_bloc.dart';
import 'blocs/product_filter/product_filter_bloc.dart';
import 'blocs/product_search/product_search_bloc.dart';
import 'blocs/total_product/total_product_bloc.dart';
import 'router/app_routes.dart';
import 'blocs/product_cart/product_cart_bloc.dart';
import 'blocs/product_list/product_list_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(),
        ),
        BlocProvider<ProductCartBloc>(
          create: (context) => ProductCartBloc(),
        ),
        BlocProvider<ProductFilterBloc>(
          create: (context) => ProductFilterBloc(),
        ),
        BlocProvider<ProductSearchBloc>(
          create: (context) => ProductSearchBloc(),
        ),
        BlocProvider<TotalProductBloc>(
          create: (context) => TotalProductBloc(
            context.read<ProductCartBloc>(),
          ),
        ),
        BlocProvider<FilteredProductsBloc>(
          create: (context) => FilteredProductsBloc(
            productListBloc: context.read<ProductListBloc>(),
            productSearchBloc: context.read<ProductSearchBloc>(),
            productFilterBloc: context.read<ProductFilterBloc>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        title: 'Grocery Shop',
        initialRoute: '/onboarding',
        routes: AppRoutes.routes,
      ),
    );
  }
}
