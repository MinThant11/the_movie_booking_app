import 'package:hive_flutter/adapters.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

class UserDao {
  static final UserDao _singleton = UserDao._internal();

  factory UserDao() {
    return _singleton;
  }

  UserDao._internal();

  // Stream<void> watchUserBox() {
  //   return getUserBox().watch();
  // }

  /// Clear User Data
  void clearUserData() async {
    await getUserBox().clear();
  }

  /// Save User Data
  void saveUserData(UserVO userData) async {
    await getUserBox().clear();
    return getUserBox().put(userData.id, userData);
  }

  /// Get User Data
  UserVO? getUserData() {
    return getUserBox().values.firstOrNull;
  }

  /// User Box
  Box<UserVO> getUserBox() {
    return Hive.box<UserVO>(kBoxNameUserVO);
  }

}