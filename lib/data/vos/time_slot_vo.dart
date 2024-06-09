import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'time_slot_vo.g.dart';

@JsonSerializable()
class TimeSlotVO {

  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String? startTime;

  @JsonKey(name: "status")
  int? status;

  TimeSlotVO(this.cinemaDayTimeslotId, this.startTime, this.status);

  factory TimeSlotVO.fromJson(Map<String, dynamic> json) => _$TimeSlotVOFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotVOToJson(this);
}