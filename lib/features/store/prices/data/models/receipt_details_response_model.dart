import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'receipt_details_response_model.g.dart';

@JsonSerializable(checked: true)
class ReceiptDetailsResponseModel {
  final ReceiptModel data;

  ReceiptDetailsResponseModel({required this.data});

  factory ReceiptDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptDetailsResponseModelToJson(this);
}
