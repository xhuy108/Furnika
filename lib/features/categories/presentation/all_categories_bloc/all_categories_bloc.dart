import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/features/categories/domain/usecases/get_all_categories.dart';

part 'all_categories_event.dart';
part 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  final GetAllCategories _getAllCategories;

  AllCategoriesBloc({required GetAllCategories getAllCategories})
      : _getAllCategories = getAllCategories,
        super(AllCategoriesInitial()) {
    on<FetchAllCategories>(_onFetchAllCategories);
  }

  void _onFetchAllCategories(
      FetchAllCategories event, Emitter<AllCategoriesState> emit) async {
    emit(AllCategoryLoading());

    final result = await _getAllCategories();

    result.fold(
      (failure) => emit(AllCategoryError(failure.message)),
      (categories) => emit(AllCategoryLoaded(categories)),
    );
  }
}
