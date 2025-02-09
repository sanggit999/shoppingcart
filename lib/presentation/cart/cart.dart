import 'package:flutter/material.dart';
import 'package:shoppingcart/common/widgets/appbar/basic_app_bar.dart';
import 'package:shoppingcart/common/widgets/product/product_quantity.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const BasicAppBar(
          hideBack: false,
          title: Text(
            'Cart',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return const ProductQuantity(
              isButton: false,
              isShowBox: true,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: 6,
        ));
  }
}
