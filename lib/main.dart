import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/category/category_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/product/product_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';
import 'package:flutter_ecommerce_app/repositories/category/category_repository.dart';
import 'package:flutter_ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:flutter_ecommerce_app/repositories/product/product_repository.dart';
import 'package:flutter_ecommerce_app/simple_bloc_observer.dart';

import 'config/theme.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'hseperidian',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenarateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
