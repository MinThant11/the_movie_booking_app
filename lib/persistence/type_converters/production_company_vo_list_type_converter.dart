import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:the_movie_booking_app/data/vos/production_company_vo.dart';

class ProductionCompanyVOListTypeConverter extends TypeConverter<List<ProductionCompanyVO>?, String?> {

  @override
  List<ProductionCompanyVO>? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }

    Iterable<Map<String, dynamic>> decodeList = json.decode(databaseValue);

    List<ProductionCompanyVO> productionCompanies = decodeList.map((model) {
      return ProductionCompanyVO.fromJson(model);
    }).toList();

    return productionCompanies;
  }

  @override
  String? encode(List<ProductionCompanyVO>? value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.map((productionCompany) => productionCompany.toJson()).toList());
  }
}