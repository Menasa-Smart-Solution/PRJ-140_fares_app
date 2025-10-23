import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'store_parcels_details_response_model.g.dart';

@JsonSerializable(checked: true)
class StoreParcelsDetailsResponseModel {
  final StoreParcelModel data;

  StoreParcelsDetailsResponseModel({required this.data});

  factory StoreParcelsDetailsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$StoreParcelsDetailsResponseModelFromJson(json);
}
