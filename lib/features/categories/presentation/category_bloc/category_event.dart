part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

final class FetchPopularCategories extends CategoryEvent {}

final class FetchOtherCategories extends CategoryEvent {}

final class SelectCategory extends CategoryEvent {
  const SelectCategory(this.category);

  final Category category;

  @override
  List<Object> get props => [category];
}
