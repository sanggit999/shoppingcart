import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/common/cubit/product/product_quantity_cubit.dart';
import 'package:shoppingcart/common/helper/product/format_currency.dart';
import 'package:shoppingcart/common/widgets/button/basic_app_button.dart';
import 'package:shoppingcart/common/widgets/product/selected_quantity.dart';
import 'package:shoppingcart/data/cart/models/cart.dart';
import 'package:shoppingcart/presentation/home/cubit/add_to_cart_cubit.dart';

class ProductQuantity extends StatelessWidget {
  final int productId;
  final String imageUrl;
  final String name;
  final double price;
  final bool isButton;
  final bool isShowBox;
  final Widget? widget;
  final Function()? onTap;
  const ProductQuantity(
      {Key? key,
      this.isButton = true,
      this.isShowBox = false,
      this.onTap,
      required this.productId,
      required this.imageUrl,
      required this.name,
      required this.price,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isShowBox
            ? const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: Offset(0, 2)),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _imageProduct(),
              const SizedBox(width: 10),
              _quantitySelector(context),
              const SizedBox(width: 10),
              _closeAndPrice()
            ],
          ),
          isButton ? _buttonAddToCart(context) : const SizedBox()
        ],
      ),
    );
  }

  Widget _imageProduct() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _quantitySelector(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          widget ??
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.read<ProductQuantityCubit>().decrement();
                        },
                        splashColor: Colors.amber,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              border:
                                  Border(right: BorderSide(color: Colors.grey)),
                            ),
                            child: const Icon(Icons.remove)),
                      ),
                    ),
                    BlocBuilder<ProductQuantityCubit, int>(
                      builder: (context, state) {
                        return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return BlocProvider.value(
                                      value:
                                          BlocProvider.of<ProductQuantityCubit>(
                                              context),
                                      child: SelectedQuantity(
                                        name: name,
                                      ),
                                    );
                                  },
                                );
                              },
                              splashColor: Colors.amber,
                              child: SizedBox(
                                width: 60,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    state.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.read<ProductQuantityCubit>().increment();
                        },
                        splashColor: Colors.amber,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              border: Border(
                                left: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: const Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }

  Widget _closeAndPrice() {
    return BlocBuilder<ProductQuantityCubit, int>(
      builder: (context, state) {
        final priceToString =
            FormatCurrencyHelper.formatCurrency(price.toInt() * state);
        return Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: const Icon(Icons.close),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                priceToString,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade600),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buttonAddToCart(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        context.read<AddToCartCubit>().addToCart(
              CartItem(
                  productId: productId,
                  imageUrl: imageUrl,
                  name: name,
                  price: price,
                  quantity: context.read<ProductQuantityCubit>().state),
            );

        Navigator.pop(context);
      },
      title: 'Add to cart',
    );
  }
}
