class CartItem {
  final int productId;
  final String imageUrl;
  final String name;
  final double price;
  final int quantity;

  CartItem(
      {required this.productId,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.quantity});

  CartItem copyWith({
    int? productId,
    String? imageUrl,
    String? name,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
