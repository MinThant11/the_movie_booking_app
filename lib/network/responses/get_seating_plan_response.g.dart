// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_seating_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSeatingPlanResponse _$GetSeatingPlanResponseFromJson(
        Map<String, dynamic> json) =>
    GetSeatingPlanResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => SeatVO.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GetSeatingPlanResponseToJson(
        GetSeatingPlanResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
