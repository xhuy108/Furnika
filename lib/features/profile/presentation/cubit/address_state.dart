part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressesLoaded extends AddressState {
  const AddressesLoaded({required this.addresses});

  final List<Address> addresses;

  @override
  List<Object> get props => [addresses];
}

final class AddressFail extends AddressState {
  const AddressFail({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
