import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'snacks_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdSnacksVO, adapterName: kAdapterNameSnacksVO)
class SnacksVO {

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "description")
  @HiveField(2)
  String? description;

  @JsonKey(name: "price")
  @HiveField(3)
  double? price;

  @JsonKey(name: "category_id")
  @HiveField(4)
  int? categoryId;

  @JsonKey(name: "image")
  @HiveField(5)
  String? image;

  @JsonKey(name: "quantity")
  @HiveField(6)
  int? quantity;

  SnacksVO(this.id, this.name, this.description, this.price, this.categoryId,
      this.image,  this.quantity);

  factory SnacksVO.fromJson(Map<String, dynamic> json) => _$SnacksVOFromJson(json);

  Map<String, dynamic> toJson() => _$SnacksVOToJson(this);

  /// Sub Total
  double subTotal() {
    return (price ?? 0) * (quantity ?? 0);
  }

  /// Snack Image
  String snackImage() {
    return kTmbaImageBaseUrl + (image ?? "");
  }
}