part of 'location_category_bloc.dart';

sealed class LocationCategoryState extends Equatable {
  const LocationCategoryState();

  @override
  List<Object> get props => [];
}

final class LocationCategoryInitial extends LocationCategoryState {}

final class LocationCategoryLoading extends LocationCategoryState {}

final class LocationCategoryLoaded extends LocationCategoryState {
  final List<Category> locationCategories;

  const LocationCategoryLoaded(this.locationCategories);

  @override
  List<Object> get props => [locationCategories];
}

final class LocationCategoryError extends LocationCategoryState {
  final String message;

  const LocationCategoryError(this.message);

  @override
  List<Object> get props => [message];
}
