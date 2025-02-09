import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final bool isHot;
  final String image;
  final String name;
  final String price;
  const ProductCard({
    super.key,
    this.isHot = true,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 150,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
              if (isHot)
                (Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Text('🔥', style: TextStyle(fontSize: 14)),
                  ),
                ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.amber.shade600,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_checkout_outlined,
                        color: Colors.amber,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
