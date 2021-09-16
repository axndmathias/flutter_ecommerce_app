import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
