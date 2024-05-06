import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/features/categories/domain/usecases/get_all_categories.dart';
import 'package:furnika/features/categories/domain/usecases/get_other_categories.dart';
import 'package:furnika/features/categories/domain/usecases/get_popular_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategories _getAllCategories;
  final GetPopularCategories _getPopularCategories;
  final GetOtherCategories _getOtherCategories;

  CategoryBloc({
    required GetAllCategories getAllCategories,
    required GetPopularCategories getPopularCategories,
    required GetOtherCategories getOtherCategories,
  })  : _getAllCategories = getAllCategories,
        _getPopularCategories = getPopularCategories,
        _getOtherCategories = getOtherCategories,
        super(CategoryInitial()) {
    on<FetchPopularCategories>(_onFetchPopularCategories);
    on<FetchOtherCategories>(_onFetchOtherCategories);
  }

  void _onFetchPopularCategories(
      FetchPopularCategories event, Emitter<CategoryState> emit) async {
    emit(PopularCategoryLoading());

    final result = await _getPopularCategories();

    result.fold(
      (failure) => emit(PopularCategoryError(failure.message)),
      (categories) => emit(PopularCategoryLoaded(categories)),
    );
  }

  void _onFetchOtherCategories(
      FetchOtherCategories event, Emitter<CategoryState> emit) async {
    emit(OtherCategoryLoading());

    final result = await _getOtherCategories();

    result.fold(
      (failure) => emit(OtherCategoryError(failure.message)),
      (categories) => emit(OtherCategoryLoaded(categories)),
    );
  }
}
