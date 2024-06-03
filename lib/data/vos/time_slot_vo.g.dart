// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotVO _$TimeSlotVOFromJson(Map<String, dynamic> json) => TimeSlotVO(
      (json['cinema_day_timeslot_id'] as num?)?.toInt(),
      json['start_time'] as String?,
      (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TimeSlotVOToJson(TimeSlotVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
      'status': instance.status,
    };
