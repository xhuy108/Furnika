import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String id;
  final String customer;
  final String phoneNumber;
  final String detailedAddress;
  final String district;
  final String city;
  final String country;
  final bool isDefault;

  const Address({
    required this.id,
    required this.customer,
    required this.phoneNumber,
    required this.detailedAddress,
    required this.district,
    required this.country,
    required this.city,
    this.isDefault = false,
  });

  @override
  List<Object> get props => [
        customer,
        phoneNumber,
        detailedAddress,
        district,
        country,
        city,
      ];
}
