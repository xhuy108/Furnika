part of 'location_category_bloc.dart';

sealed class LocationCategoryEvent extends Equatable {
  const LocationCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetLocationCategoriesEvent extends LocationCategoryEvent {}
