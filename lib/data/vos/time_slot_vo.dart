import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'time_slot_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdTimeSlotVO, adapterName: kAdapterNameTimeSlotVO)
class TimeSlotVO {

  @JsonKey(name: "cinema_day_timeslot_id")
  @HiveField(0)
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  @HiveField(1)
  String? startTime;

  @JsonKey(name: "status")
  @HiveField(2)
  int? status;

  TimeSlotVO(this.cinemaDayTimeslotId, this.startTime, this.status);

  factory TimeSlotVO.fromJson(Map<String, dynamic> json) => _$TimeSlotVOFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotVOToJson(this);
}