import 'package:fares/core/helpers/helper_func.dart';
import 'package:json_annotation/json_annotation.dart';
part 'city_response_model.g.dart';

@JsonSerializable()
class CityResponseModel {
  final List<CityModel> data;

  CityResponseModel({required this.data});
  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class CityModel {
  final int id;
  final String name;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @StringConverter()
  final String price;
  @JsonKey(name: 'downpayment')
  @StringConverter()
  final String downPayment;
  @JsonKey(name: 'sub_cities')
  final List<SubCitiesModel>? subCities;

  CityModel({
    required this.id,
    required this.name,
    this.createdAt,
    required this.price,
    required this.downPayment,
    this.subCities,
  });
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

@JsonSerializable(checked: true)
class SubCitiesModel {
  final int id;
  final String name;
  @StringConverter()
  final String price;
  @JsonKey(name: 'delivery_man_price')
  @NullableStringConverter()
  final String? deliveryManPrice;

  SubCitiesModel({
    required this.id,
    required this.name,
    required this.price,
    this.deliveryManPrice,
  });

  factory SubCitiesModel.fromJson(Map<String, dynamic> json) =>
      _$SubCitiesModelFromJson(json);
}
