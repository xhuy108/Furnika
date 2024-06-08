part of 'function_categories_bloc.dart';

sealed class FunctionCategoriesState extends Equatable {
  const FunctionCategoriesState();

  @override
  List<Object> get props => [];
}

final class FunctionCategoriesInitial extends FunctionCategoriesState {}

final class FunctionCategoriesLoading extends FunctionCategoriesState {}

final class FunctionCategoriesLoaded extends FunctionCategoriesState {
  final List<Category> categories;

  const FunctionCategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class FunctionCategoriesError extends FunctionCategoriesState {
  final String message;

  const FunctionCategoriesError(this.message);

  @override
  List<Object> get props => [message];
}
