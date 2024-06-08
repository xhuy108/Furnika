import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/features/categories/domain/usecases/get_function_category.dart';

part 'function_categories_event.dart';
part 'function_categories_state.dart';

class FunctionCategoriesBloc
    extends Bloc<FunctionCategoriesEvent, FunctionCategoriesState> {
  final GetFunctionCategories _getFunctionCategories;

  FunctionCategoriesBloc(
      {required GetFunctionCategories getFunctionalCategories})
      : _getFunctionCategories = getFunctionalCategories,
        super(FunctionCategoriesInitial()) {
    on<GetFunctionCategoriesEvent>((event, emit) async {
      emit(FunctionCategoriesLoading());
      final result = await _getFunctionCategories.call();
      result.fold(
        (failure) => emit(FunctionCategoriesError(failure.message)),
        (categories) => emit(FunctionCategoriesLoaded(categories)),
      );
    });
  }
}
