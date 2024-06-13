import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

class CityDao {
  static final CityDao _singleton = CityDao._internal();

  factory CityDao() {
    return _singleton;
  }

  CityDao._internal();

  /// Save City List
  void saveCityList(List<CityVO> cities) async {
    Map<int, CityVO> cityMap = { for (var city in cities) (city.id ?? 0) : city };
    return getCityBox().putAll(cityMap);
  }

  /// Get City List
  List<CityVO> getCityList() {
    return getCityBox().values.map((city) => city).toList();
  }

  /// City Box
  Box<CityVO> getCityBox() {
    return Hive.box<CityVO>(kBoxNameCityVO);
  }

}