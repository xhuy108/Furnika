import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/cart/domain/entities/cart.dart';
import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';
import 'package:furnika/features/cart/domain/usecases/add_to_cart.dart';
import 'package:furnika/features/cart/domain/usecases/decrease_cart_quantity.dart';
import 'package:furnika/features/cart/domain/usecases/empty_cart.dart';
import 'package:furnika/features/cart/domain/usecases/get_cart.dart';
import 'package:furnika/features/cart/domain/usecases/increase_cart_quantity.dart';
import 'package:furnika/features/cart/domain/usecases/remove_cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCart getCart;
  final AddToCart addToCart;
  final IncreaseCartQuantity increaseCartQuantity;
  final DecreaseCartQuantity decreaseCartQuantity;
  final RemoveCartItem removeCartItem;
  final EmptyCart emptyCart;

  CartCubit({
    required this.getCart,
    required this.addToCart,
    required this.increaseCartQuantity,
    required this.decreaseCartQuantity,
    required this.removeCartItem,
    required this.emptyCart,
  }) : super(CartInitial());

  void fetchCart() async {
    emit(CartLoading());
    final result = await getCart.call();
    result.fold(
      (failure) => emit(CartError(failure.errorMessage)),
      (cart) {
        return emit(CartLoaded(cart: cart));
      },
    );
  }

  void addProductToCart({
    required Product product,
    required int quantity,
    required String color,
  }) {
    addToCart.call(
      AddToCartParams(
        product: product,
        quantity: quantity,
        color: color,
      ),
    );

    final newState = state as CartLoaded;

    final index = newState.cart.items.indexWhere((element) =>
        element.product.id == product.id && element.color == color);

    if (index != -1) {
      newState.cart.items[index] = newState.cart.items[index].copyWith(
        quantity: newState.cart.items[index].quantity + quantity,
      );
    } else {
      newState.cart.items.insert(
        0,
        CartItemEntity(
          id: product.id,
          product: product,
          quantity: quantity,
          price: product.price,
          color: color,
        ),
      );
    }

    //print(newState.cart.cartTotalQuantity);

    Cart updatedCart = newState.cart.copyWith(
      cartTotalQuantity: newState.cart.cartTotalQuantity + quantity,
      cartTotalPrice: newState.cart.cartTotalPrice + product.price * quantity,
    );

    emit(CartLoaded(cart: updatedCart));
  }

  void increaseQuantity({required Product product}) {
    increaseCartQuantity.call(IncreaseCartQuantityParams(product: product));

    final newState = state as CartLoaded;

    final index = newState.cart.items
        .indexWhere((element) => element.product.id == product.id);

    if (index != -1) {
      newState.cart.items[index] = newState.cart.items[index].copyWith(
        quantity: newState.cart.items[index].quantity + 1,
      );
    }

    Cart updatedCart = newState.cart.copyWith(
      cartTotalQuantity: newState.cart.cartTotalQuantity + 1,
      cartTotalPrice: newState.cart.cartTotalPrice + product.price,
    );

    emit(CartLoaded(cart: updatedCart));
  }

  void decreaseQuantity({required Product product}) {
    decreaseCartQuantity.call(DecreaseCartQuantityParams(product: product));

    final newState = state as CartLoaded;

    final index = newState.cart.items
        .indexWhere((element) => element.product.id == product.id);

    if (index != -1) {
      newState.cart.items[index] = newState.cart.items[index].copyWith(
        quantity: newState.cart.items[index].quantity - 1,
      );
    }

    Cart updatedCart = newState.cart.copyWith(
      cartTotalQuantity: newState.cart.cartTotalQuantity - 1,
      cartTotalPrice: newState.cart.cartTotalPrice - product.price,
    );

    emit(CartLoaded(cart: updatedCart));
  }

  void removeProduct({required String productId}) {
    removeCartItem.call(productId);

    int quantity = 0;
    double price = 0;

    final newState = state as CartLoaded;

    final index = newState.cart.items.indexWhere((element) {
      quantity = element.quantity;
      price = element.price;
      return element.product.id == productId;
    });

    if (index != -1) {
      newState.cart.items.removeAt(index);
    }

    Cart updatedCart = newState.cart.copyWith(
      cartTotalQuantity: newState.cart.cartTotalQuantity - quantity,
      cartTotalPrice: newState.cart.cartTotalPrice - price * quantity,
    );

    emit(CartLoaded(cart: updatedCart));
  }

  void emptyCartItem() {
    emptyCart.call();

    final newState = state as CartLoaded;

    newState.cart.items.clear();

    Cart updatedCart = newState.cart.copyWith(
      cartTotalQuantity: 0,
      cartTotalPrice: 0,
    );

    emit(CartLoaded(cart: updatedCart));
  }
}
