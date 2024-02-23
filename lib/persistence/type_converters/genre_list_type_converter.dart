import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:the_movie_booking_app/data/vos/genre_vo.dart';

class GenreListTypeConverter extends TypeConverter<List<GenreVO>?, String?> {

  @override
  List<GenreVO>? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }

    Iterable<Map<String, dynamic>> decodeList = json.decode(databaseValue);

    List<GenreVO> genres = decodeList.map((model) {
      return GenreVO.fromJson(model);
    }).toList();

    return genres;

  }

  @override
  String? encode(List<GenreVO>? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.map((genre) => genre.toJson()).toList());
  }
}