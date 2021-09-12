// ignore_for_file: use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_model.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      // ignore: prefer_const_constructors
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

// product images carousel

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: const CustomNavBar(),
      body: ListView(
        children: [CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: [
            HeroCarouselCard(
              product: product,
            ),
          ],
        ),
        ],
      ),
    );
  }
}
