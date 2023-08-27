import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'router/app_routes.dart';

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
