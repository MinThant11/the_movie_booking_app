import 'package:the_movie_booking_app/data/vos/checkout_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/network/requests/checkout_request.dart';
import 'package:the_movie_booking_app/network/responses/get_otp_response.dart';

abstract class TmbaDataAgent {

  Future<GetOtpResponse> getOtp(String phone);

  Future<UserVO> signInWithPhone(String phone, String otp);

  Future<List<CityVO>> getCities();

  Future<List<CinemaVO>> getCinema(String bearerToken, String date);

  Future<List<List<SeatVO>>> getSeatingPlan(String bearerToken, int cinemaDayTimeslotId, String bookingDate);

  Future<List<SnackCategoryVO>> getSnackCategories(String bearerToken);

  Future<List<SnacksVO>> getSnacks(String bearerToken, int categoryId);

  Future<List<PaymentTypeVO>> getPaymentTypes(String bearerToken);

  Future<CheckoutRequest> checkoutRequest(String bearerToken, CheckoutRequest checkoutRequest);

  Future<CheckoutVO> getCheckout(String bearerToken);

}