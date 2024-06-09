part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistSuccess extends WishlistState {
  final List<Product> products;

  const WishlistSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class DeleteFromWishlistSuccess extends WishlistState {
  final List<Product> products;

  const DeleteFromWishlistSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class WishlistFailure extends WishlistState {
  final String message;

  const WishlistFailure({required this.message});

  @override
  List<Object> get props => [message];
}
