import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';
import 'package:furnika/features/profile/domain/repositories/address_repository.dart';

class GetAllAddresses implements UseCaseWithoutParams<List<Address>> {
  final AddressRepository repository;

  const GetAllAddresses(this.repository);

  @override
  ResultFuture<List<Address>> call() {
    return repository.getAllAddresses();
  }
}
