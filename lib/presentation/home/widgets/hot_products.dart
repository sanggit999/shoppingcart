import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/widgets/product/product_card.dart';
import 'package:shoppingcart/common/widgets/shimmer/shimmer_loading_list.dart';
import 'package:shoppingcart/presentation/home/cubit/product_display_cubit.dart';
import 'package:shoppingcart/presentation/home/widgets/product_quantity.dart';

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
            return state ? const ShimmerLoadingList() : _hotProducts();
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

  Widget _hotProducts() {
    List<Map<String, String>> hotProducts = [
      {
        'image': 'assets/images/product_0.jpg',
        'name': 'Product #0',
        'price': '160,000 đ'
      },
      {
        'image': 'assets/images/product_1.jpg',
        'name': 'Product #1',
        'price': '170,000 đ'
      },
      {
        'image': 'assets/images/product_2.jpg',
        'name': 'Product #2',
        'price': '180,000 đ'
      },
      {
        'image': 'assets/images/product_3.jpg',
        'name': 'Product #3',
        'price': '190,000 đ'
      },
      {
        'image': 'assets/images/product_4.jpg',
        'name': 'Product #4',
        'price': '200,000 đ'
      },
      {
        'image': 'assets/images/product_5.jpg',
        'name': 'Product #5',
        'price': '210,000 đ'
      },
    ];

    return SizedBox(
      height: 240,
      child: ListView.separated(
          padding: const EdgeInsets.all(6),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = hotProducts[index];
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ProductQuantity();
                  },
                );
              },
              child: ProductCard(
                  image: product['image']!,
                  name: product['name']!,
                  price: product['price']!),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: hotProducts.length),
    );
  }
}
