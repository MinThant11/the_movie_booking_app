// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snacks_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnacksVO _$SnacksVOFromJson(Map<String, dynamic> json) => SnacksVO(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['category_id'] as int?,
      json['image'] as String?,
      json['quantity'] as int?,
    );

Map<String, dynamic> _$SnacksVOToJson(SnacksVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category_id': instance.categoryId,
      'image': instance.image,
      'quantity': instance.quantity,
    };
