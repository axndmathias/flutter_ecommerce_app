import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(settings: const RouteSettings(name: routeName), builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Hesperidian'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}