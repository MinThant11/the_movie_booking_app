import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'payment_type_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdPaymentTypeVO, adapterName: kAdapterNamePaymentTypeVO)
class PaymentTypeVO {

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "title")
  @HiveField(1)
  String? title;

  @JsonKey(name: "icon")
  @HiveField(2)
  String? icon;

  @JsonKey(name: "created_at")
  @HiveField(3)
  String? createdAt;

  @JsonKey(name: "updated_at")
  @HiveField(4)
  String? updatedAt;

  @JsonKey(name: "deleted_at")
  @HiveField(5)
  String? deletedAt;

  PaymentTypeVO(this.id, this.title, this.icon, this.createdAt, this.updatedAt,
      this.deletedAt);

  factory PaymentTypeVO.fromJson(Map<String, dynamic> json) => _$PaymentTypeVOFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypeVOToJson(this);
}