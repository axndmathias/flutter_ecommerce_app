import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/home_screen.dart';

class AppRouter {
  static Route onGenarateRoute(RouteSettings settings){
    // ignore: avoid_print
    print(':::::: This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
      return HomeScreen.route();
      case HomeScreen.routeName:
      return HomeScreen.route();

      default:
      return _errorRoute();
    }
  }
}