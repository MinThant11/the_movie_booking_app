import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/cinema_vo.dart';

part 'get_cinema_response.g.dart';

@JsonSerializable()
class GetCinemaResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaVO>? data;

  GetCinemaResponse(this.code, this.message, this.data);

  factory GetCinemaResponse.fromJson(Map<String, dynamic> json) => _$GetCinemaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCinemaResponseToJson(this);
}