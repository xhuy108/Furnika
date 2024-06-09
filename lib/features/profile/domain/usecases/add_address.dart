import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:furnika/features/profile/domain/repositories/address_repository.dart';

class AddAddress implements UseCaseWithParams<void, AddressModel> {
  final AddressRepository repository;

  AddAddress(this.repository);

  @override
  ResultFuture<void> call(AddressModel params) {
    return repository.addAddress(params);
  }
}
