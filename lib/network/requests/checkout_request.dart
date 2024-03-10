import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/checkout_vo.dart';
import 'package:the_movie_booking_app/data/vos/snacks_vo.dart';

part 'checkout_request.g.dart';

@JsonSerializable()
class CheckoutRequest {

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "seat_number")
  String? seatNumber;

  @JsonKey(name: "booking_date")
  String? bookingDate;

  @JsonKey(name: "movie_id")
  int? movieId;

  @JsonKey(name: "payment_type_id")
  int? paymentTypeId;

  @JsonKey(name: "snacks")
  List<SnacksVO>? snacks;

  CheckoutRequest(this.name, this.cinemaDayTimeslotId, this.seatNumber,
      this.bookingDate, this.movieId, this.paymentTypeId, this.snacks);

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) => _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);

}