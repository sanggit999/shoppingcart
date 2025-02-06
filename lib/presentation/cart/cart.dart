import 'package:flutter/material.dart';
import 'package:shoppingcart/core/configs/theme/custom_theme/basic_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(
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
    );
  }
}
