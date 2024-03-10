// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCheckoutResponse _$GetCheckoutResponseFromJson(Map<String, dynamic> json) =>
    GetCheckoutResponse(
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : CheckoutVO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCheckoutResponseToJson(
        GetCheckoutResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
