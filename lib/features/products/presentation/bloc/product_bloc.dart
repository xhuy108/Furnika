import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/products/domain/usecases/get_popular_products.dart';
import 'package:furnika/features/products/domain/usecases/get_product_by_category.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetPopularProducts _getPopularProducts;
  final GetProductsByCategory _getProductsByCategory;

  ProductBloc({
    required GetPopularProducts getPopularProducts,
    required GetProductsByCategory getProductsByCategory,
  })  : _getPopularProducts = getPopularProducts,
        _getProductsByCategory = getProductsByCategory,
        super(ProductsInitial()) {
    on<ProductEvent>((event, emit) {
      emit(ProductsLoading());
    });
    on<GetPopularProductsEvent>(_onFetchPopularProducts);
    on<GetProductsByCategoryEvent>(_onFetchProductsByCategory);
  }

  void _onFetchPopularProducts(
      GetPopularProductsEvent event, Emitter<ProductState> emit) async {
    final result = await _getPopularProducts.call();
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  void _onFetchProductsByCategory(
      GetProductsByCategoryEvent event, Emitter<ProductState> emit) async {
    final result = await _getProductsByCategory.call(event.categoryId);
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
