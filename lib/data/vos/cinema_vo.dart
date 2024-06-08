import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/time_slot_vo.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'cinema_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdCinemaVO, adapterName: kAdapterNameCinemaVO)
class CinemaVO {

  @JsonKey(name: "cinema_id")
  @HiveField(0)
  int? cinemaId;

  @JsonKey(name: "cinema")
  @HiveField(1)
  String? cinema;

  @JsonKey(name: "timeslots")
  @HiveField(2)
  List<TimeSlotVO>? timeSlots;

  CinemaVO(this.cinemaId, this.cinema, this.timeSlots);

  factory CinemaVO.fromJson(Map<String, dynamic> json) => _$CinemaVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaVOToJson(this);
}