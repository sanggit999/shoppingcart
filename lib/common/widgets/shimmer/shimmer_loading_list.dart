import 'package:flutter/material.dart';

import 'package:shoppingcart/common/widgets/product/product_shimmer.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 240,
        child: ListView.separated(
          padding: const EdgeInsets.all(6),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductShimmer();
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: 6,
        ));
  }
}
