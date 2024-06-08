import 'package:the_movie_booking_app/data/vos/checkout_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:the_movie_booking_app/network/data_agents/tmba_data_agent.dart';
import 'package:the_movie_booking_app/network/requests/checkout_request.dart';
import 'package:the_movie_booking_app/network/responses/get_otp_response.dart';
import 'package:the_movie_booking_app/persistence/cinema_dao.dart';
import 'package:the_movie_booking_app/persistence/city_dao.dart';
import 'package:the_movie_booking_app/persistence/credit_dao.dart';
import 'package:the_movie_booking_app/persistence/payment_type_dao.dart';
import 'package:the_movie_booking_app/persistence/snacks_dao.dart';
import 'package:the_movie_booking_app/persistence/user_dao.dart';

class TmbaModel {
  static TmbaModel? _singleton;

  factory TmbaModel() {
    _singleton ??= TmbaModel._internal();
    return _singleton!;
  }

  TmbaModel._internal();

  /// Daos
  final UserDao _userDao = UserDao();
  final CityDao _cityDao = CityDao();
  final CinemaDao _cinemaDao = CinemaDao();
  final SnacksDao _snacksDao = SnacksDao();
  final PaymentTypeDao _paymentTypeDao = PaymentTypeDao();

  /// Data Agent
  TmbaDataAgent tmbaDataAgent = RetrofitDataAgentImpl();

  /// OTP
  Future<GetOtpResponse> getOtp(String phone) {
    return tmbaDataAgent.getOtp(phone);
  }

  /// Sign In
  Future<UserVO> signInWithPhone(String phone, String otp) {
    return tmbaDataAgent.signInWithPhone(phone, otp).then((userData) {

      _userDao.saveUserData(userData);

      return userData;
    });
  }

  /// Get User Data From Database
  UserVO? getUserDataFromDatabase() {
    return _userDao.getUserData();
  }
  // Stream<UserVO?> getUserDataFromDatabase() {
  //   return _userDao.watchUserBox().map((_) => _userDao.getUserData());
  // }

  /// Cities
  Future<List<CityVO>> getCities() {
    return tmbaDataAgent.getCities().then((citiesList) async {

      _cityDao.saveCity(citiesList);

      return citiesList;
    });
  }

  /// Get Cities From Database
  List<CityVO> getCitiesFromDatabase() {
    return _cityDao.getCity();
  }

  /// Cinema
  /// <List<CinemaVO>>
  Future getCinema(String bearerToken, String date) {
    return tmbaDataAgent.getCinema(bearerToken, date).then((cinemas) {
      _cinemaDao.saveCinema(cinemas);
    });
  }
  /// Get Cinema From Database
  Stream<List<CinemaVO>> getCinemaFromDatabase() {
    return _cinemaDao.watchCinemaBox().map((_) => _cinemaDao.getCinema());
  }

  /// Seating Plan
  Future<List<List<SeatVO>>> getSeatingPlan(String bearerToken, int cinemaDayTimeslotId, String bookingDate){
    return tmbaDataAgent.getSeatingPlan(bearerToken, cinemaDayTimeslotId, bookingDate);
  }

  /// Snack Categories
  Future<List<SnackCategoryVO>> getSnackCategories(String bearerToken){
    return tmbaDataAgent.getSnackCategories(bearerToken);
  }

  /// Snacks
  /// <List<SnacksVO>>
  Future getSnacks(String bearerToken, int categoryId){
    return tmbaDataAgent.getSnacks(bearerToken, categoryId).then((snacksList) {
      _snacksDao.saveSnacks(snacksList);
    });
  }
  /// Get Snacks From Database
  Stream<List<SnacksVO>> getSnacksFromDatabase() {
    return _snacksDao.watchSnacksBox().map((_) => _snacksDao.getSnacksByCategoryId());
  }

  /// Payment Types
  /// <List<PaymentTypeVO>>
  Future getPaymentTypes(String bearerToken){
    return tmbaDataAgent.getPaymentTypes(bearerToken).then((paymentTypes) {
      _paymentTypeDao.savePaymentType(paymentTypes);
    });
  }
  /// Get Payment Type From Database
  Stream<List<PaymentTypeVO>> getPaymentTypesFromDatabase() {
    return _paymentTypeDao.watchPaymentType().map((_) => _paymentTypeDao.getPaymentType());
  }

  /// Checkout Request
  Future<CheckoutRequest> checkoutRequest(String bearerToken, CheckoutRequest checkoutRequest){
    return tmbaDataAgent.checkoutRequest(bearerToken, checkoutRequest);
  }

  /// Checkout
  Future<CheckoutVO> getCheckout(String bearerToken) {
    return tmbaDataAgent.getCheckout(bearerToken);
  }

}