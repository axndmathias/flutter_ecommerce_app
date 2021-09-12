import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce_app/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter_ecommerce_app/screens/screens.dart';
import 'package:flutter_ecommerce_app/screens/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenarateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print(':::::: This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      // ignore: no_duplicate_case_values
      case HomeScreen.routeName:
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case WishlistScreen.routeName:
        return WishlistScreen.route();

      case ProductScreen.routeName:
      return ProductScreen.route(product: settings.arguments as Product);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
      ),
    );
  }
}
