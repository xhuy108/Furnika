part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductState {}

final class ProductsLoading extends ProductState {}

final class ProductsLoaded extends ProductState {
  final List<Product> products;

  const ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductsError extends ProductState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
