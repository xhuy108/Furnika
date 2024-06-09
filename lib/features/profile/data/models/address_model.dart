import 'dart:convert';

import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.customer,
    required super.phoneNumber,
    required super.detailedAddress,
    required super.district,
    required super.city,
    required super.country,
    super.isDefault,
  });

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(jsonDecode(source) as DataMap);

  AddressModel.fromMap(DataMap map)
      : super(
          id: map['id'] == null ? 'order' : map['id'] as String,
          customer: map['customer'] as String,
          phoneNumber: map['phoneNumber'] as String,
          detailedAddress: map['detailedAddress'] as String,
          district: map['district'] as String,
          city: map['city'] as String,
          country: map['country'] as String,
          isDefault:
              map['isDefault'] == null ? false : map['isDefault'] as bool,
        );

  DataMap toMap() => {
        'customer': customer,
        'phoneNumber': phoneNumber,
        'detailedAddress': detailedAddress,
        'district': district,
        'city': city,
        'country': country,
      };

  String toJson() => jsonEncode(toMap());

  AddressModel copyWith({
    String? id,
    String? customer,
    String? phoneNumber,
    String? detailedAddress,
    String? district,
    String? city,
    String? country,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      detailedAddress: detailedAddress ?? this.detailedAddress,
      district: district ?? this.district,
      city: city ?? this.city,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
