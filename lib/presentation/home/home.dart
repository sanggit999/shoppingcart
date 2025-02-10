import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/widgets/appbar/basic_app_bar.dart';
import 'package:shoppingcart/data/cart/models/cart.dart';
import 'package:shoppingcart/presentation/cart/cart.dart';
import 'package:shoppingcart/presentation/home/cubit/add_to_cart_cubit.dart';
import 'package:shoppingcart/presentation/home/widgets/all_products.dart';
import 'package:shoppingcart/presentation/home/widgets/hot_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BasicAppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: BlocBuilder<AddToCartCubit, List<CartItem>>(
          builder: (context, state) {
            return Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      )),
                ),
                state.isEmpty
                    ? const SizedBox()
                    : Positioned(
                        left: 5,
                        bottom: 5,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Text(
                            context
                                .read<AddToCartCubit>()
                                .getTotalQuantity()
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotProducts(),
            SizedBox(height: 24),
            AllProducts(),
          ],
        ),
      ),
    );
  }
}
