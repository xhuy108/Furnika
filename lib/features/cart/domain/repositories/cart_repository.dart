import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  const CartRepository();

  ResultFuture<Cart> getCart();

  ResultFuture<void> addToCart({
    required Product product,
    required int quantity,
    required String color,
  });

  ResultFuture<void> increaseCartQuantity({
    required Product product,
  });

  ResultFuture<void> decreaseCartQuantity({
    required Product product,
  });

  ResultFuture<void> removeProduct({
    required String productId,
  });

  ResultFuture<void> emptyCart();
}
