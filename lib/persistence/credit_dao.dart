import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

import '../data/vos/credit_vo.dart';

class CreditDao {
  static final CreditDao _singleton = CreditDao._internal();

  factory CreditDao() {
    return _singleton;
  }

  CreditDao._internal();

  Stream<void> watchCreditBox() {
    return getCreditBox().watch();
  }

  /// Save Cast
  void saveCast(List<CreditVO> casts) async {
    Map<int, CreditVO> castMap = { for (var cast in casts) (cast.id ?? 0) : cast };
    return getCreditBox().putAll(castMap);
  }

  /// Get Cast
  List<CreditVO> getCast() {
    return getCreditBox().values.toList();
  }

  /// Credit Box
  Box<CreditVO> getCreditBox() {
    return Hive.box(kBoxNameCreditVO);
  }
}