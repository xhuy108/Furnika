part of 'all_categories_bloc.dart';

sealed class AllCategoriesState extends Equatable {
  const AllCategoriesState();

  @override
  List<Object> get props => [];
}

final class AllCategoriesInitial extends AllCategoriesState {}

final class AllCategoryLoading extends AllCategoriesState {}

final class AllCategoryLoaded extends AllCategoriesState {
  final List<Category> categories;

  const AllCategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class AllCategorySelected extends AllCategoriesState {
  final Category category;

  const AllCategorySelected(this.category);

  @override
  List<Object> get props => [category];
}

final class AllCategoryError extends AllCategoriesState {
  final String message;

  const AllCategoryError(this.message);

  @override
  List<Object> get props => [message];
}
