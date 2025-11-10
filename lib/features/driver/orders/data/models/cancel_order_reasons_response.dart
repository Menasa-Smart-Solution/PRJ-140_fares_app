import 'package:fares/core/helpers/helper_func.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cancel_order_reasons_response.g.dart';

@JsonSerializable()
class CancelOrderReasonsResponse {
  @JsonKey(name: 'data')
  final List<ReasonsModel> reasons;

  CancelOrderReasonsResponse({required this.reasons});

  factory CancelOrderReasonsResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelOrderReasonsResponseFromJson(json);
}

@JsonSerializable(checked: true)
class ReasonsModel {
  @StringConverter()
  final String id;
  final String name;

  ReasonsModel({required this.id, required this.name});

  factory ReasonsModel.fromJson(Map<String, dynamic> json) =>
      _$ReasonsModelFromJson(json);
}
