import 'package:flutter/material.dart';
import 'package:grocery_shop_app_ui/screens/cart_screen.dart';
import 'package:grocery_shop_app_ui/screens/home_screen.dart';
import 'package:grocery_shop_app_ui/screens/onboarding_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const HomeScreen(),
    '/cart': (BuildContext context) => const CartScreen(),
    '/onboarding': (BuildContext context) => const OnboardingScreen(),
  };
}
