// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    CheckoutRequest(
      json['name'] as String?,
      json['cinema_day_timeslot_id'] as int?,
      json['seat_number'] as String?,
      json['booking_date'] as String?,
      json['movie_id'] as int?,
      json['payment_type_id'] as int?,
      (json['snacks'] as List<dynamic>?)
          ?.map((e) => SnacksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'seat_number': instance.seatNumber,
      'booking_date': instance.bookingDate,
      'movie_id': instance.movieId,
      'payment_type_id': instance.paymentTypeId,
      'snacks': instance.snacks,
    };
