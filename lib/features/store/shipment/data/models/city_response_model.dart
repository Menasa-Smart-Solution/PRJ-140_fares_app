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
  final String createdAt;
  final String price;
  @JsonKey(name: 'downpayment')
  final String downPayment;

  CityModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.price,
    required this.downPayment,
  });
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
