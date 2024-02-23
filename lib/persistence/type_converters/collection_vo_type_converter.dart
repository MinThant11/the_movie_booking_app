import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:the_movie_booking_app/data/vos/collection_vo.dart';

class CollectionVOConverter extends TypeConverter<CollectionVO?, String?> {

  @override
  CollectionVO? decode(String? databaseValue) {
    if (databaseValue == null) {
      return null;
    }
    return CollectionVO.fromJson(json.decode(databaseValue) as Map<String, dynamic>);
  }

  @override
  String? encode(CollectionVO? value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.toJson());
  }
}