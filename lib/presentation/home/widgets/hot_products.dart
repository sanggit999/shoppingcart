import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/cubit/product/product_quantity_cubit.dart';
import 'package:shoppingcart/common/widgets/product/product_card.dart';
import 'package:shoppingcart/common/widgets/shimmer/shimmer_loading_list.dart';
import 'package:shoppingcart/data/models/product.dart';
import 'package:shoppingcart/presentation/home/cubit/product_display_cubit.dart';

class HotProducts extends StatelessWidget {
  const HotProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleHotProducts(),
        const SizedBox(height: 16),
        BlocBuilder<ProductDisplayCubit, bool>(
          builder: (context, state) {
            return state ? const ShimmerLoadingList() : _hotProducts(context);
          },
        ),
      ],
    );
  }

  Widget _titleHotProducts() {
    return Text(
      'HOT Products 🔥',
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.amber.shade900),
    );
  }

  Widget _hotProducts(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
          padding: const EdgeInsets.all(6),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              productId: product.productId,
              image: product.imageUrl,
              name: product.name,
              price: product.price,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: products.length),
    );
  }
}
