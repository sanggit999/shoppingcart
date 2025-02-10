class ProductModel {
  final int productId;
  final String imageUrl;
  final String name;
  final double price;

  ProductModel({
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

List<ProductModel> products = [
  ProductModel(
    productId: 0,
    imageUrl: 'assets/images/product_0.jpg',
    name: 'Product #0',
    price: 160000,
  ),
  ProductModel(
    productId: 1,
    imageUrl: 'assets/images/product_1.jpg',
    name: 'Product #1',
    price: 170000,
  ),
  ProductModel(
    productId: 2,
    imageUrl: 'assets/images/product_2.jpg',
    name: 'Product #2',
    price: 180000,
  ),
  ProductModel(
    productId: 3,
    imageUrl: 'assets/images/product_3.jpg',
    name: 'Product #3',
    price: 190000,
  ),
  ProductModel(
    productId: 4,
    imageUrl: 'assets/images/product_4.jpg',
    name: 'Product #4',
    price: 200000,
  ),
  ProductModel(
    productId: 5,
    imageUrl: 'assets/images/product_5.jpg',
    name: 'Product #5',
    price: 210000,
  ),
];
