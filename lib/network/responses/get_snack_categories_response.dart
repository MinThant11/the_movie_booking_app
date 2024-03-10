import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking_app/data/vos/snack_category_vo.dart';

part 'get_snack_categories_response.g.dart';

@JsonSerializable()
class GetSnackCategoriesResponse {

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SnackCategoryVO>? data;

  GetSnackCategoriesResponse(this.code, this.message, this.data);

  factory GetSnackCategoriesResponse.fromJson(Map<String, dynamic> json) => _$GetSnackCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSnackCategoriesResponseToJson(this);

}