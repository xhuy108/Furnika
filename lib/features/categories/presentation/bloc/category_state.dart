part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class AllCategoryLoading extends CategoryState {}

final class AllCategoryLoaded extends CategoryState {
  final List<Category> categories;

  const AllCategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class AllCategorySelected extends CategoryState {
  final Category category;

  const AllCategorySelected(this.category);

  @override
  List<Object> get props => [category];
}

final class AllCategoryError extends CategoryState {
  final String message;

  const AllCategoryError(this.message);

  @override
  List<Object> get props => [message];
}

final class PopularCategoryLoading extends CategoryState {}

final class PopularCategoryLoaded extends CategoryState {
  final List<Category> categories;

  const PopularCategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class PopularCategorySelected extends CategoryState {
  final Category category;

  const PopularCategorySelected(this.category);

  @override
  List<Object> get props => [category];
}

final class PopularCategoryError extends CategoryState {
  final String message;

  const PopularCategoryError(this.message);

  @override
  List<Object> get props => [message];
}

final class OtherCategoryLoading extends CategoryState {}

final class OtherCategoryLoaded extends CategoryState {
  final List<Category> categories;

  const OtherCategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class OtherCategoryError extends CategoryState {
  final String message;

  const OtherCategoryError(this.message);

  @override
  List<Object> get props => [message];
}
