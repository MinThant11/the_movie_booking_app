// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_category_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoryVO _$SnackCategoryVOFromJson(Map<String, dynamic> json) =>
    SnackCategoryVO(
      json['id'] as int?,
      json['title'] as String?,
      json['title_mm'] as String?,
      json['is_active'] as int?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
      json['icon'] as String?,
    );

Map<String, dynamic> _$SnackCategoryVOToJson(SnackCategoryVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_mm': instance.titleMM,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'icon': instance.icon,
    };
