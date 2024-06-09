import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:furnika/core/common/entities/city.dart';
import 'package:dio/dio.dart';

String convertAddressName(String name) {
  final addressList = name.split("_");
  final newAddressList = [];
  for (final item in addressList) {
    newAddressList
        .add('${item[0].toUpperCase()}${item.substring(1).toLowerCase()}');
  }

  return newAddressList.join(" ");
}

Future<List<City>> getCities() async {
  List<City> cities = [];

  final String response =
      await rootBundle.loadString('assets/json/json_data_vn_units.json');
  final List<dynamic> data = jsonDecode(response);

  for (final item in data) {
    List<String> districts = [];
    for (final district in item['District']) {
      districts.add(district['NameEn'] as String);
    }
    cities.add(
      City(
        name: item['NameEn'] as String,
        code: item['Code'] as String,
        districts: districts,
      ),
    );
  }

  return cities;
}
