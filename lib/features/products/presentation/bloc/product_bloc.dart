import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/products/domain/usecases/get_popular_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetPopularProducts _getPopularProducts;

  ProductBloc({required GetPopularProducts getPopularProducts})
      : _getPopularProducts = getPopularProducts,
        super(ProductsInitial()) {
    on<ProductEvent>((event, emit) {
      emit(ProductsLoading());
    });
    on<GetPopularProductsEvent>(_onFetchPopularProducts);
  }

  void _onFetchPopularProducts(
      GetPopularProductsEvent event, Emitter<ProductState> emit) async {
    final result = await _getPopularProducts.call();
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}
