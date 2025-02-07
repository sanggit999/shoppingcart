import 'package:flutter/material.dart';
import 'package:shoppingcart/common/widgets/product/product_shimmer.dart';

class ShimmerLoadingGird extends StatelessWidget {
  const ShimmerLoadingGird({super.key});

  @override
  Widget build(BuildContext context) {
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
        return ProductShimmer();
      },
      itemCount: 8,
    );
  }
}
