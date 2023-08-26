import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import '../screens/complete_inventory_screen.dart';
import '../screens/products_screen.dart.dart';
import '../screens/onboarding_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const ProductsScreen(),
    '/cart': (BuildContext context) => const CartScreen(),
    '/onboarding': (BuildContext context) => const OnboardingScreen(),
    '/completeInventory': (BuildContext context) =>
        const CompleteInventoryScreen(),
  };
}
