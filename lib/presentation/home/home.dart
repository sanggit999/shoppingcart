import 'package:flutter/material.dart';
import 'package:shoppingcart/common/widgets/product/product_card.dart';
import 'package:shoppingcart/core/configs/theme/custom_theme/basic_app_bar.dart';
import 'package:shoppingcart/presentation/cart/cart.dart';

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
        actions: Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  )),
            ),
            Positioned(
              left: 5,
              bottom: 5,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: const Text(
                  '3',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleHotProducts(),
            const SizedBox(height: 16),
            _hotProducts(),
            const SizedBox(height: 24),
            _titleAllProducts(),
            const SizedBox(height: 16),
            _allProducts()
          ],
        ),
      ),
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
            return ProductCard(
                image: product['image']!,
                name: product['name']!,
                price: product['price']!);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: hotProducts.length),
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
    List<Map<String, String>> allProducts = [
      {
        'image': 'assets/images/product_6.jpg',
        'name': 'Product #6',
        'price': '160,000 đ'
      },
      {
        'image': 'assets/images/product_7.jpg',
        'name': 'Product #7',
        'price': '170,000 đ'
      },
      {
        'image': 'assets/images/product_8.jpg',
        'name': 'Product #8',
        'price': '180,000 đ'
      },
      {
        'image': 'assets/images/product_9.jpg',
        'name': 'Product #9',
        'price': '190,000 đ'
      },
    ];
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          final product = allProducts[index];
          return ProductCard(
            image: product['image']!,
            name: product['name']!,
            price: product['price']!,
            isHot: false,
          );
        },
        itemCount: allProducts.length,
      ),
    );
  }
}
