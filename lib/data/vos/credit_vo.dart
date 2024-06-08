import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/persistence/hive_constants.dart';

part 'credit_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdCreditVO, adapterName: kAdapterNameCreditVO)
class CreditVO {

  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "id")
  @HiveField(2)
  int? id;

  @JsonKey(name: "known_for_department")
  @HiveField(3)
  String? knowForDepartment;

  @JsonKey(name: "name")
  @HiveField(4)
  String? name;

  @JsonKey(name: "original_name")
  @HiveField(5)
  String? originalName;

  @JsonKey(name: "popularity")
  @HiveField(6)
  double? popularity;

  @JsonKey(name: "profile_path")
  @HiveField(7)
  String? profilePath;

  @JsonKey(name: "cast_id")
  @HiveField(8)
  int? castId;

  @JsonKey(name: "character")
  @HiveField(9)
  String? character;

  @JsonKey(name: "credit_id")
  @HiveField(10)
  String? creditId;

  @JsonKey(name: "order")
  @HiveField(11)
  int? order;

  @JsonKey(name: "department")
  @HiveField(12)
  String? department;

  @JsonKey(name: "job")
  @HiveField(13)
  String? job;

  CreditVO(
      {this.adult,
      this.gender,
      this.id,
      this.knowForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order,
      this.department,
      this.job});

  factory CreditVO.fromJson(Map<String, dynamic> json) => _$CreditVOFromJson(json);

  Map<String, dynamic> toJson() => _$CreditVOToJson(this);
}
