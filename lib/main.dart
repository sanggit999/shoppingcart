import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/cubit/product/product_quantity_cubit.dart';
import 'package:shoppingcart/core/configs/theme/app_theme.dart';
import 'package:shoppingcart/presentation/home/cubit/add_to_cart_cubit.dart';
import 'package:shoppingcart/presentation/home/cubit/product_display_cubit.dart';
import 'package:shoppingcart/presentation/splash/cubit/splash_cubit.dart';
import 'package:shoppingcart/presentation/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()..appStarted()),
        BlocProvider(create: (_) => ProductDisplayCubit()..loadingProduct()),
        BlocProvider(create: (_) => ProductQuantityCubit()),
        BlocProvider(create: (_) => AddToCartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        theme: AppTheme.light,
        home: const SplashScreen(),
      ),
    );
  }
}
