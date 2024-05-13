import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/wishlist/domain/usecases/add_or_remove_product.dart';
import 'package:furnika/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:furnika/features/wishlist/domain/usecases/remover_product_from_wishlist.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlist getWishlist;
  final AddOrRemoveProductFromWishlist addOrRemoveProductFromWishlist;
  final RemoveProductFromWishlist removeProductFromWishlist;

  WishlistCubit({
    required this.getWishlist,
    required this.addOrRemoveProductFromWishlist,
    required this.removeProductFromWishlist,
  }) : super(WishlistInitial());

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());

    final result = await getWishlist.call();
    result.fold(
      (failure) => emit(
        WishlistFailure(message: failure.errorMessage),
      ),
      (products) => emit(
        WishlistSuccess(products: products),
      ),
    );
  }

  Future<void> addOrRemoveProduct(Product product) async {
    await addOrRemoveProductFromWishlist.call(product.id);

    final newProductsList = (state as WishlistSuccess).products;
    final newProducts = newProductsList.contains(product)
        ? newProductsList.where((element) => element.id != product.id).toList()
        : [...newProductsList, product];

    emit(state is WishlistSuccess
        ? WishlistSuccess(products: newProducts)
        : WishlistInitial());
  }

  Future<void> removeProduct(String id) async {
    final result = await removeProductFromWishlist.call(id);
    result.fold(
      (failure) => emit(
        WishlistFailure(message: failure.errorMessage),
      ),
      (products) => emit(
        DeleteFromWishlistSuccess(products: products),
      ),
    );
  }
}
