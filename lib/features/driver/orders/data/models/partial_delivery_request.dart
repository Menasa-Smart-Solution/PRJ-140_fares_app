import 'package:json_annotation/json_annotation.dart';
part 'partial_delivery_request.g.dart';

@JsonSerializable()
class PartialDeliveryRequest {
  @JsonKey(name: 'parcel_id')
  final int parcelId;
  @JsonKey(name: 'received_count')
  final int quantity;
  @JsonKey(name: 'received_money')
  final int receivedMoney;

  PartialDeliveryRequest({
    required this.parcelId,
    required this.quantity,
    required this.receivedMoney,
  });

  Map<String, dynamic> toJson() => _$PartialDeliveryRequestToJson(this);
}
