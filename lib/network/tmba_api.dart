import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/network/requests/checkout_request.dart';
import 'package:the_movie_booking_app/network/responses/get_checkout_response.dart';
import 'package:the_movie_booking_app/network/responses/get_cinema_response.dart';
import 'package:the_movie_booking_app/network/responses/get_cities_response.dart';
import 'package:the_movie_booking_app/network/responses/get_otp_response.dart';
import 'package:the_movie_booking_app/network/responses/get_payment_types_response.dart';
import 'package:the_movie_booking_app/network/responses/get_seating_plan_response.dart';
import 'package:the_movie_booking_app/network/responses/get_snack_categories_response.dart';
import 'package:the_movie_booking_app/network/responses/get_snacks_response.dart';
import 'package:the_movie_booking_app/network/responses/sign_in_with_phone_response.dart';

part 'tmba_api.g.dart';

@RestApi(baseUrl: kTmbaBaseUrl)
abstract class TmbaApi {
  factory TmbaApi(Dio dio) = _TmbaApi;

  @POST(kTmbaEndPointGetOtp)
  @FormUrlEncoded()
  Future<GetOtpResponse> getOtp(
    @Field(kTmbaParamPhone) String phone,
  );

  @POST(kTmbaEndPointSignInWithPhone)
  @FormUrlEncoded()
  Future<SignInWithPhoneResponse> signInWithPhone(
    @Field(kTmbaParamPhone) String phone,
    @Field(kTmbaParamOtp) String otp,
  );

  @GET(kTmbaEndPointGetCities)
  Future<GetCitiesResponse?> getCities();

  @GET(kTmbaEndPointGetCinema)
  Future<GetCinemaResponse> getCinema(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
    @Query(kTmbaParamDate) String date,
  );

  @GET(kTmbaEndPointGetSeatingPlan)
  Future<GetSeatingPlanResponse> getSeatingPlan(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
    @Query(kTmbaParamCinemaDayTimeslotId) int cinemaDayTimeslotId,
    @Query(kTmbaParamBookingDate) String bookingDate,
  );

  @GET(kTmbaEndPointGetSnackCategories)
  Future<GetSnackCategoriesResponse> getSnackCategories(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
  );

  @GET(kTmbaEndPointGetSnacks)
  Future<GetSnacksResponse> getSnacks(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
    @Query(kTmbaParamCategoryId) int categoryId,
  );

  @GET(kTmbaEndPointGetPaymentType)
  Future<GetPaymentTypesResponse> getPaymentTypes(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
  );

  @POST(kTmbaEndPointCheckout)
  Future<CheckoutRequest> checkoutRequest(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
    @Body() CheckoutRequest checkoutRequest,
  );

  @GET(kTmbaEndPointCheckout)
  Future<GetCheckoutResponse> getCheckout(
    @Header(kTmbaHeaderAuthorization) String bearerToken,
  );
}
