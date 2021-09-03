import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Hesperidian'),
      bottomNavigationBar: const CustomNavBar(),
      // ignore: avoid_unnecessary_containers
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('RECOMMENDED',
                  style: Theme.of(context).textTheme.headline3),
            ),
          ),
        ],
      ),
    );
  }
}
