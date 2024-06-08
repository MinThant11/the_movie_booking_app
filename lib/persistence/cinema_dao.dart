import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

class CinemaDao {
  static final CinemaDao _singleton = CinemaDao._internal();

  factory CinemaDao() {
    return _singleton;
  }

  CinemaDao._internal();

  Stream<void> watchCinemaBox() {
    return getCinemaBox().watch();
  }

  /// Save Cinema
  void saveCinema(List<CinemaVO> cinemas) async {
    Map<int, CinemaVO> cinemaMap = { for (var cinema in cinemas) (cinema.cinemaId ?? 0) : cinema };
    return getCinemaBox().putAll(cinemaMap);
  }

  /// Get Cinema
  List<CinemaVO> getCinema() {
    return getCinemaBox().values.toList();
  }

  /// Cinema Box
  Box<CinemaVO> getCinemaBox() {
    return Hive.box<CinemaVO>(kBoxNameCinemaVO);
  }

}