import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/checkout_vo.dart';

part 'get_checkout_response.g.dart';

@JsonSerializable()
class GetCheckoutResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  CheckoutVO? data;

  GetCheckoutResponse(this.code, this.message, this.data);

  factory GetCheckoutResponse.fromJson(Map<String, dynamic> json) => _$GetCheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCheckoutResponseToJson(this);
}