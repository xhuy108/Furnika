part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetPopularProductsEvent extends ProductEvent {}

class GetProductsByCategoryEvent extends ProductEvent {
  final String categoryId;

  const GetProductsByCategoryEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class SearchProductsByNameEvent extends ProductEvent {
  const SearchProductsByNameEvent(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

class SearchProductsByNamePerCategoryEvent extends ProductEvent {
  const SearchProductsByNamePerCategoryEvent(this.categoryId, this.text);

  final String categoryId;
  final String text;

  @override
  List<Object> get props => [categoryId, text];
}
