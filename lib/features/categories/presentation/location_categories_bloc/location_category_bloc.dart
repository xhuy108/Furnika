import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/features/categories/domain/usecases/get_location_categories.dart';

part 'location_category_event.dart';
part 'location_category_state.dart';

class LocationCategoryBloc
    extends Bloc<LocationCategoryEvent, LocationCategoryState> {
  final GetLocationCategories _getLocationCategories;

  LocationCategoryBloc({required GetLocationCategories getLocationCategories})
      : _getLocationCategories = getLocationCategories,
        super(LocationCategoryInitial()) {
    on<GetLocationCategoriesEvent>((event, emit) async {
      emit(LocationCategoryLoading());
      final result = await _getLocationCategories.call();

      result.fold(
        (failure) => emit(LocationCategoryError(failure.message)),
        (categories) => emit(LocationCategoryLoaded(categories)),
      );
    });
  }
}
