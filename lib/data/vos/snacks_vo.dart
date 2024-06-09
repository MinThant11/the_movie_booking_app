import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/network/api_constants.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'snacks_vo.g.dart';

@JsonSerializable()
class SnacksVO {

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "category_id")
  int? categoryId;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "quantity")
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