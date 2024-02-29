import 'package:json_annotation/json_annotation.dart';

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

  /// In CheckOut
  @JsonKey(name: "unit_price")
  double? unitPrice;

  @JsonKey(name: "quantity")
  int? quantity;


  SnacksVO(this.id, this.name, this.description, this.price, this.categoryId,
      this.image, this.unitPrice, this.quantity);

  factory SnacksVO.fromJson(Map<String, dynamic> json) => _$SnacksVOFromJson(json);

  Map<String, dynamic> toJson() => _$SnacksVOToJson(this);
}