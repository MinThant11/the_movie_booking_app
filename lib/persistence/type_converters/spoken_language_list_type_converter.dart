import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:the_movie_booking_app/data/vos/spoken_language_vo.dart';

class SpokenLanguageListTypeConverter extends TypeConverter<List<SpokenLanguageVO>?, String?> {

  @override
  List<SpokenLanguageVO>? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }

    Iterable<Map<String, dynamic>> decodeList = json.decode(databaseValue);

    List<SpokenLanguageVO> spokenLanguages = decodeList.map((model) {
      return SpokenLanguageVO.fromJson(model);
    }).toList();

    return spokenLanguages;
  }

  @override
  String? encode(List<SpokenLanguageVO>? value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.map((spokenLanguage) => spokenLanguage.toJson()).toList());
  }
}