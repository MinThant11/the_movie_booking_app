import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:the_movie_booking_app/data/vos/production_country_vo.dart';

class ProductionCountryVOListTypeConverter extends TypeConverter<List<ProductionCountryVO>?, String?> {

  @override
  List<ProductionCountryVO>? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }

    Iterable<Map<String, dynamic>> decodeList = json.decode(databaseValue);

    List<ProductionCountryVO> productionCountries = decodeList.map((model) {
      return ProductionCountryVO.fromJson(model);
    }).toList();

    return productionCountries;
  }

  @override
  String? encode(List<ProductionCountryVO>? value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.map((productionCountry) => productionCountry.toJson()).toList());
  }
}