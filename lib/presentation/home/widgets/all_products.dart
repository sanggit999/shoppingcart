import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/helper/product/format_currency.dart';
import 'package:shoppingcart/common/widgets/product/product_card.dart';
import 'package:shoppingcart/common/widgets/shimmer/shimmer_loading_gird.dart';
import 'package:shoppingcart/presentation/home/cubit/product_display_cubit.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleAllProducts(),
        const SizedBox(height: 16),
        BlocBuilder<ProductDisplayCubit, bool>(
          builder: (context, state) {
            return state ? const ShimmerLoadingGird() : _allProducts();
          },
        )
      ],
    );
  }

  Widget _titleAllProducts() {
    return Text(
      'All Products',
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.amber.shade900),
    );
  }

  Widget _allProducts() {
    List<Map<String, dynamic>> allProducts = [
      {
        'image': 'assets/images/product_6.jpg',
        'name': 'Product #6',
        'price': 160000
      },
      {
        'image': 'assets/images/product_7.jpg',
        'name': 'Product #7',
        'price': 170000
      },
      {
        'image': 'assets/images/product_8.jpg',
        'name': 'Product #8',
        'price': 180000
      },
      {
        'image': 'assets/images/product_9.jpg',
        'name': 'Product #9',
        'price': 190000
      },
      {
        'image': 'assets/images/product_9.jpg',
        'name': 'Product #9',
        'price': 200000
      },
      {
        'image': 'assets/images/product_9.jpg',
        'name': 'Product #9',
        'price': 20000000000000
      },
      {
        'image': 'assets/images/product_9.jpg',
        'name': 'Product #9',
        'price': 200000
      },
      {
        'image': 'assets/images/product_9.jpg',
        'name': 'Product #9',
        'price': 200000
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(6),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8),
      itemBuilder: (context, index) {
        final product = allProducts[index];
        final price = FormatCurrencyHelper.formatCurrency(product['price']);
        return ProductCard(
          image: product['image']!,
          name: product['name']!,
          price: price.toString(),
          isHot: false,
        );
      },
      itemCount: allProducts.length,
    );
  }
}
