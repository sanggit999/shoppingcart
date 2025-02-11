import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/cubit/product/product_quantity_cubit.dart';
import 'package:shoppingcart/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:shoppingcart/common/helper/product/format_currency.dart';
import 'package:shoppingcart/common/widgets/product/product_quantity.dart';

class ProductCard extends StatelessWidget {
  final bool isHot;
  final int productId;
  final String image;
  final String name;
  final double price;
  const ProductCard({
    super.key,
    this.isHot = true,
    required this.image,
    required this.name,
    required this.price,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final priceToString = FormatCurrencyHelper.formatCurrency(price.toInt());

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
                        priceToString,
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
                      onPressed: () {
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
                            child: ProductQuantity(
                              productId: productId,
                              imageUrl: image,
                              name: name,
                              price: price,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );

                        context.read<ProductQuantityCubit>().initial();
                      },
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
