import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_cubit_state.dart';

class FilterCubitCubit extends Cubit<FilterCubitState> {
  FilterCubitCubit() : super(FilterCubitInitial());
}
