import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/seat_vo.dart';

part 'get_seating_plan_response.g.dart';

@JsonSerializable()
class GetSeatingPlanResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<List<SeatVO>>? data;

  GetSeatingPlanResponse(this.code, this.message, this.data);

  factory GetSeatingPlanResponse.fromJson(Map<String, dynamic> json) => _$GetSeatingPlanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSeatingPlanResponseToJson(this);
}