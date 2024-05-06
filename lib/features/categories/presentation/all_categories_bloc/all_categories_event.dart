part of 'all_categories_bloc.dart';

sealed class AllCategoriesEvent extends Equatable {
  const AllCategoriesEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllCategories extends AllCategoriesEvent {}

final class SelectCategory extends AllCategoriesEvent {
  const SelectCategory(this.category);

  final Category category;

  @override
  List<Object> get props => [category];
}
