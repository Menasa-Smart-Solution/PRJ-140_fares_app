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
  final String price;
  @JsonKey(name: 'downpayment')
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
  final String price;
  @JsonKey(name: 'delivery_man_price')
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
