import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/data/cart/models/cart.dart';

class AddToCartCubit extends Cubit<List<CartItem>> {
  AddToCartCubit() : super([]);

  void addToCart(CartItem product) {
    final existingIndex =
        state.indexWhere((item) => item.productId == product.productId);

    if (existingIndex != -1) {
      List<CartItem> updatedItems = List.from(state);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + product.quantity,
      );
      emit(updatedItems);
    } else {
      emit([...state, product]);
    }
  }

  void incrementQuantity(int productId) {
    List<CartItem> updatedItems = state.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
    emit(updatedItems);
  }

  void decrementQuantity(int productId) {
    List<CartItem> updatedItems = state.map((item) {
      if (item.productId == productId) {
        return item.copyWith(quantity: item.quantity - 1);
      }
      return item;
    }).toList();

    updatedItems.removeWhere(
        (item) => item.productId == productId && item.quantity <= 0);

    emit(updatedItems);
  }

  void removeFromCart(int productId) {
    List<CartItem> updatedItems =
        state.where((item) => item.productId != productId).toList();
    emit(updatedItems);
  }

  int getTotalQuantity() {
    return state.fold(0, (total, item) => total + item.quantity);
  }

  int get totalPrice {
    return state.fold(
        0, (total, item) => total + item.price.toInt() * item.quantity);
  }

  void clearCart() {
    emit([]);
  }
}
