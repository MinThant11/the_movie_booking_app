// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutVO _$CheckoutVOFromJson(Map<String, dynamic> json) => CheckoutVO(
      (json['id'] as num?)?.toInt(),
      json['booking_no'] as String?,
      json['booking_date'] as String?,
      json['row'] as String?,
      json['seat'] as String?,
      (json['total_seat'] as num?)?.toInt(),
      json['total'] as String?,
      (json['movie_id'] as num?)?.toInt(),
      (json['cinema_id'] as num?)?.toInt(),
      json['username'] as String?,
      json['timeslot'] == null
          ? null
          : TimeSlotVO.fromJson(json['timeslot'] as Map<String, dynamic>),
      (json['snacks'] as List<dynamic>?)
          ?.map((e) => SnacksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['qr_code'] as String?,
    );

Map<String, dynamic> _$CheckoutVOToJson(CheckoutVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_no': instance.bookingNo,
      'booking_date': instance.bookingDate,
      'row': instance.row,
      'seat': instance.seat,
      'total_seat': instance.totalSeat,
      'total': instance.total,
      'movie_id': instance.movieId,
      'cinema_id': instance.cinemaId,
      'username': instance.username,
      'timeslot': instance.timeSlot,
      'snacks': instance.snacks,
      'qr_code': instance.qrCode,
    };
