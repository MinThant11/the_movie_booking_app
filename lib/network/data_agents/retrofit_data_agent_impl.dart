import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/data/vos/checkout_vo.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';
import 'package:the_movie_booking_app/data/vos/city_vo.dart';
import 'package:the_movie_booking_app/data/vos/credit_vo.dart';
import 'package:the_movie_booking_app/data/vos/error_vo.dart';
import 'package:the_movie_booking_app/data/vos/movie_vo.dart';
import 'package:the_movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';
import 'package:the_movie_booking_app/data/vos/user_vo.dart';
import 'package:the_movie_booking_app/exception/custom_exception.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/network/data_agents/the_movie_booking_data_agent.dart';
import 'package:the_movie_booking_app/network/data_agents/tmba_data_agent.dart';
import 'package:the_movie_booking_app/network/requests/checkout_request.dart';
import 'package:the_movie_booking_app/network/responses/get_otp_response.dart';
import 'package:the_movie_booking_app/network/the_movie_booking_api.dart';
import 'package:the_movie_booking_app/network/tmba_api.dart';

class RetrofitDataAgentImpl implements TheMovieBookingDataAgent, TmbaDataAgent {
  late TheMovieBookingApi mApi;
  late TmbaApi tmbaApi;

  static RetrofitDataAgentImpl? _singleton;

  factory RetrofitDataAgentImpl() {
    _singleton ??= RetrofitDataAgentImpl._internal();
    return _singleton!;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieBookingApi(dio);
    tmbaApi = TmbaApi(dio);
  }

  @override
  Future<List<MovieVO>> getComingSoonMovies(String page) {
    return mApi
        .getComingSoonMovies(kApiKey, kLanguageENUS, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(String page) {
    return mApi
        .getNowPlayingMovies(kApiKey, kLanguageENUS, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<MovieVO> getMovieDetails(String movieId) {
    return mApi
        .getMovieDetails(movieId, kApiKey, kLanguageENUS)
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    return mApi
        .getCreditsByMovie(movieId, kApiKey, kLanguageENUS, 1.toString())
        .asStream()
        .map((response) => response?.cast ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  /// Create Exception
  CustomException _createException(dynamic error) {
    ErrorVO errorVO;

    /// Error Type Check
    if (error is DioException) {
      errorVO = _parseDioError(error);
    } else {
      errorVO = ErrorVO(
          statusCode: 0, statusMessage: 'Unexpected Error', success: false);
    }
    return CustomException(errorVO);
  }

  ErrorVO _parseDioError(DioException error) {
    try {
      if (error.response != null && error.response?.data != null) {
        var data = error.response?.data;

        /// Json String to Map<String, dynamic>
        if (data is String) {
          data = jsonDecode(data);
        }

        /// Map<String, dynamic> to ErrorVO
        return ErrorVO.fromJson(data);
      } else {
        return ErrorVO(
            statusCode: 0, statusMessage: 'No response data', success: false);
      }
    } catch (e) {
      return ErrorVO(
          statusCode: 0,
          statusMessage: "Invalid DioException Format: $e",
          success: false);
    }
  }

  // ToDo//:
  @override
  Future<List<MovieVO>> searchMovies(String query) {
    return mApi.searchMovies(kApiKey, query)
        .asStream()
        .map((response) => response.results ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  /// ------------------------------- TMBA ----------------------------------- ///

  /// Cinema
  @override
  Future<List<CinemaVO>> getCinema(String bearerToken, String date) {
    return tmbaApi
        .getCinema(bearerToken, date)
        .asStream()
        .map((response) => response.data ?? [])
        .first;
  }

  /// Cities
  @override
  Future<List<CityVO>> getCities() {
    return tmbaApi
        .getCities()
        .asStream()
        .map((response) => response?.data ?? [])
        .first;
  }

  /// OTP
  @override
  Future<GetOtpResponse> getOtp(String phone) {
    return tmbaApi.getOtp(phone).then((response) {
      if (response.code! >= 200 && response.code! <= 299) {
        return response;
      } else {
        throw CustomException(ErrorVO(
            statusCode: response.code ?? 400,
            statusMessage: response.message ?? "Invalid",
            success: false));
      }
    });
  }

  /// Payment Types
  @override
  Future<List<PaymentTypeVO>> getPaymentTypes(String bearerToken) {
    return tmbaApi
        .getPaymentTypes(bearerToken)
        .asStream()
        .map((response) => response.data ?? [])
        .first;
    // throw UnimplementedError();
  }

  /// Seating Plan
  @override
  Future<List<List<SeatVO>>> getSeatingPlan(
      String bearerToken, int cinemaDayTimeslotId, String bookingDate) {
    return tmbaApi
        .getSeatingPlan(bearerToken, cinemaDayTimeslotId, bookingDate)
        .asStream()
        .map((response) => response.data ?? [[]])
        .first;
  }

  /// Snack Categories
  @override
  Future<List<SnackCategoryVO>> getSnackCategories(String bearerToken) {
    return tmbaApi
        .getSnackCategories(bearerToken)
        .asStream()
        .map((response) => response.data ?? [])
        .first;
  }

  /// Snacks
  @override
  Future<List<SnacksVO>> getSnacks(String bearerToken, int categoryId) {
    return tmbaApi
        .getSnacks(bearerToken, categoryId)
        .asStream()
        .map((response) => response.data ?? [])
        .first;
  }

  /// User Data
  @override
  Future<UserVO> signInWithPhone(String phone, String otp) {
    return tmbaApi.signInWithPhone(phone, otp).asStream().map((signInResponse) {
      var response = signInResponse.data;
      debugPrint(signInResponse.code.toString());
      return UserVO(
        id: response?.id ?? 0,
        name: response?.name ?? "",
        email: response?.email ?? "",
        phone: response?.phone ?? "",
        totalExpense: response?.totalExpense ?? 0,
        profileImage: response?.profileImage ?? "",
        token: "Bearer ${signInResponse.token ?? ""}",
      );
    }).first;
  }

  /// Checkout Request
  @override
  Future<CheckoutRequest> checkoutRequest(
      String bearerToken, CheckoutRequest checkoutRequest) {
    return tmbaApi.checkoutRequest(bearerToken, checkoutRequest);
  }

  @override
  Future<CheckoutVO> getCheckout(String bearerToken) {
    return tmbaApi.getCheckout(bearerToken).then((response) {
      if (response.code! >= 200 && response.code! <= 299) {
        return response.data as CheckoutVO;
      } else {
        throw CustomException(ErrorVO(
            statusCode: response.code ?? 400,
            statusMessage: response.message ?? "Invalid",
            success: false));
      }
    });
  }
}
