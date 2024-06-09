import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/products/domain/usecases/get_popular_products.dart';
import 'package:furnika/features/products/domain/usecases/get_product_by_category.dart';
import 'package:furnika/features/products/domain/usecases/search_product_by_name_per_category.dart';
import 'package:furnika/features/products/domain/usecases/search_products_by_name.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetPopularProducts _getPopularProducts;
  final GetProductsByCategory _getProductsByCategory;
  final SearchProductsByName searchProductsByName;
  final SearchProductsByNamePerCategory searchProductsByNamePerCategory;

  ProductBloc({
    required GetPopularProducts getPopularProducts,
    required GetProductsByCategory getProductsByCategory,
    required this.searchProductsByName,
    required this.searchProductsByNamePerCategory,
  })  : _getPopularProducts = getPopularProducts,
        _getProductsByCategory = getProductsByCategory,
        super(ProductsInitial()) {
    on<GetPopularProductsEvent>(_onFetchPopularProducts);
    on<GetProductsByCategoryEvent>(_onFetchProductsByCategory);
    on<SearchProductsByNameEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await searchProductsByName.call(event.text);

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          SearchProductsSuccess(products: products),
        ),
      );
    });

    on<SearchProductsByNamePerCategoryEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await searchProductsByNamePerCategory.call(
        SearchProductsByNamePerCategoryParams(
          categoryId: event.categoryId,
          text: event.text,
        ),
      );

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          SearchProductsPerCategorySuccess(products: products),
        ),
      );
    });
  }

  void _onFetchPopularProducts(
      GetPopularProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductsLoading());
    final result = await _getPopularProducts.call();
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  void _onFetchProductsByCategory(
      GetProductsByCategoryEvent event, Emitter<ProductState> emit) async {
    emit(ProductCategoryLoading());
    final result = await _getProductsByCategory.call(event.categoryId);
    result.fold(
      (failure) => emit(ProductCategoryError(failure.message)),
      (products) => emit(ProductCategoryLoaded(products)),
    );
  }
}
