import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';
import 'package:furnika/features/profile/domain/usecases/add_address.dart';
import 'package:furnika/features/profile/domain/usecases/get_all_addresses.dart';
import 'package:furnika/features/profile/domain/usecases/update_address.dart';
import 'package:furnika/features/profile/presentation/cubit/get_default_address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetDefaultAddress getDefaultAddress;
  final GetAllAddresses getAllAddresses;
  final AddAddress addServerAddress;
  final UpdateAddress updateAddress;

  AddressCubit({
    required this.getDefaultAddress,
    required this.getAllAddresses,
    required this.addServerAddress,
    required this.updateAddress,
  }) : super(AddressInitial());

  void fetchAllAddresses() async {
    emit(AddressLoading());
    final result = await getAllAddresses.call();
    result.fold(
      (failure) => emit(AddressFail(message: failure.errorMessage)),
      (addresses) {
        return emit(AddressesLoaded(addresses: addresses));
      },
    );
  }

  void reOrderAddresses(int index) {
    final newState = state as AddressesLoaded;

    final updatedAddresses = newState.addresses;
    final item = updatedAddresses.removeAt(index);

    updatedAddresses.insert(0, item);

    emit(AddressesLoaded(addresses: updatedAddresses));
  }

  void addAddress(AddressModel address) {
    try {
      addServerAddress.call(address);
      final newState = state as AddressesLoaded;

      final updatedAddresses = newState.addresses;
      if (updatedAddresses.isEmpty) {
        address = address.copyWith(isDefault: true);
      }

      updatedAddresses.add(address);

      emit(AddressesLoaded(addresses: updatedAddresses));
    } catch (e) {
      emit(AddressFail(message: e.toString()));
    }
  }

  void updateAddressItem(AddressModel address) {
    updateAddress.call(address);
    final newState = state as AddressesLoaded;

    final updatedAddresses = newState.addresses;

    final index =
        updatedAddresses.indexWhere((element) => element.id == address.id);

    if (updatedAddresses[index].isDefault) {
      address = address.copyWith(isDefault: true);
    }

    updatedAddresses[index] = address;

    emit(AddressesLoaded(addresses: updatedAddresses));
  }
}
