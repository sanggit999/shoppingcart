import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:shoppingcart/common/helper/product/format_currency.dart';
import 'package:shoppingcart/common/widgets/product/product_card.dart';
import 'package:shoppingcart/common/widgets/shimmer/shimmer_loading_list.dart';
import 'package:shoppingcart/presentation/home/cubit/product_display_cubit.dart';
import 'package:shoppingcart/common/widgets/product/product_quantity.dart';

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
    List<Map<String, dynamic>> hotProducts = [
      {
        'image': 'assets/images/product_0.jpg',
        'name': 'Product #0',
        'price': 160000
      },
      {
        'image': 'assets/images/product_1.jpg',
        'name': 'Product #1',
        'price': 170000
      },
      {
        'image': 'assets/images/product_2.jpg',
        'name': 'Product #2',
        'price': 180000
      },
      {
        'image': 'assets/images/product_3.jpg',
        'name': 'Product #3',
        'price': 190000
      },
      {
        'image': 'assets/images/product_4.jpg',
        'name': 'Product #4',
        'price': 200000
      },
      {
        'image': 'assets/images/product_5.jpg',
        'name': 'Product #5',
        'price': 210000
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
            final price = FormatCurrencyHelper.formatCurrency(product['price']);
            return GestureDetector(
              onTap: () {
                AppBottomsheet.display(
                    context,
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24))),
                      child:
                          ProductQuantity(onTap: () => Navigator.pop(context)),
                    ));
              },
              child: ProductCard(
                  image: product['image']!,
                  name: product['name']!,
                  price: price.toString()),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: hotProducts.length),
    );
  }
}
