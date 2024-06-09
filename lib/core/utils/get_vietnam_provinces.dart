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
  final Dio dio = Dio();
  List<City> cities = [];

  // print(response.body);
  final String response =
      await rootBundle.loadString('assets/json/json_data_vn_units.json');
  final List<dynamic> data = jsonDecode(response);

  for (final item in data) {
    cities.add(
      City(
        name: item['NameEn'],
        code: item['Code'],
        districts: item['District']
            .map<String>(
              (district) => district['NameEn'],
            )
            .toList(),
      ),
    );
  }

  return cities;
}
