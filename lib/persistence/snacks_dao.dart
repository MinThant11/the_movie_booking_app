import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

class SnacksDao {
  static final SnacksDao _singleton = SnacksDao._internal();

  factory SnacksDao() {
    return _singleton;
  }

  SnacksDao._internal();

  Stream<void> watchSnacksBox() {
    return getSnacksBox().watch();
  }

  /// Save Snacks
  void saveSnacks(List<SnacksVO> snacksList) async {
    Map<int, SnacksVO> snacksMap = { for (var snacks in snacksList) (snacks.id ?? 0) : snacks };
    return getSnacksBox().putAll(snacksMap);
  }

  /// Get Snacks
  List<SnacksVO> getSnacksByCategoryId() {
    return getSnacksBox().values.toList();
  }

  /// Snacks Box
  Box<SnacksVO> getSnacksBox() {
    return Hive.box<SnacksVO>(kBoxNameSnacksVO);
  }
}