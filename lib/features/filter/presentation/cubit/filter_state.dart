part of 'filter_cubit.dart';

class FilterState extends Equatable {
  const FilterState({
    this.functionCategory = '',
    this.locationCategory = '',
    this.priceRange = const ['0', '1000'],
    this.sort = '',
    this.reviews = 0,
  });

  final String functionCategory;
  final List<String> priceRange;
  final int reviews;
  final String sort;
  final String locationCategory;

  FilterState copyWith({
    String? functionCategory,
    List<String>? priceRange,
    int? reviews,
    String? sort,
    String? locationCategory,
  }) {
    return FilterState(
      functionCategory: functionCategory ?? this.functionCategory,
      priceRange: priceRange ?? this.priceRange,
      reviews: reviews ?? this.reviews,
      sort: sort ?? this.sort,
      locationCategory: locationCategory ?? this.locationCategory,
    );
  }

  @override
  List<Object> get props => [
        functionCategory,
        priceRange,
        reviews,
        sort,
        locationCategory,
      ];
}
