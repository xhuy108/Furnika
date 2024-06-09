import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';

abstract class AddressRepository {
  const AddressRepository();

  ResultFuture<List<Address>> getAllAddresses();
  ResultFuture<Address> getDefaultAddress();
  ResultFuture<void> addAddress(AddressModel address);
  ResultFuture<void> updateAddress(AddressModel address);
  ResultFuture<void> deleteAddress(AddressModel address);
}
