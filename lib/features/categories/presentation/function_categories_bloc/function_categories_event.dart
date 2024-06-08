part of 'function_categories_bloc.dart';

sealed class FunctionCategoriesEvent extends Equatable {
  const FunctionCategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetFunctionCategoriesEvent extends FunctionCategoriesEvent {}