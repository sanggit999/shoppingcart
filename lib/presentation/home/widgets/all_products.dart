import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/cubit/product/product_quantity_cubit.dart';
import 'package:shoppingcart/common/widgets/product/product_card.dart';
import 'package:shoppingcart/common/widgets/shimmer/shimmer_loading_gird.dart';
import 'package:shoppingcart/data/models/product.dart';
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
        final product = products[index];
        return ProductCard(
          productId: product.productId,
          image: product.imageUrl,
          name: product.name,
          price: product.price,
          isHot: false,
        );
      },
      itemCount: products.length,
    );
  }
}
