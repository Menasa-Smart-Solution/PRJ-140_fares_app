import 'package:json_annotation/json_annotation.dart';
part 'store_collect_request_model.g.dart';

@JsonSerializable(checked: true)
class StoreCollectRequestModel {
  final String phone;
  final String address;
  final String? notes;
  @JsonKey(name: 'collect_parcels')
  final int collectParcels;
  @JsonKey(name: 'financial_settlement')
  final int financialSettlement;
  @JsonKey(name: 'return_parcels')
  final int returnParcels;

  StoreCollectRequestModel({
    required this.phone,
    required this.address,
    this.notes,
    this.collectParcels = 0,
    this.financialSettlement = 0,
    this.returnParcels = 0,
  });

  Map<String, dynamic> toJson() => _$StoreCollectRequestModelToJson(this);
}
