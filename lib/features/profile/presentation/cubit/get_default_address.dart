import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/domain/repositories/address_repository.dart';

import '../../domain/entities/address.dart';

class GetDefaultAddress implements UseCaseWithoutParams<Address> {
  final AddressRepository repository;

  const GetDefaultAddress(this.repository);

  @override
  ResultFuture<Address> call() {
    return repository.getDefaultAddress();
  }
}
