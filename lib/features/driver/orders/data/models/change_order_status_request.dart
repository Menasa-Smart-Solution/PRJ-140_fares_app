import 'package:json_annotation/json_annotation.dart';
part 'change_order_status_request.g.dart';

@JsonSerializable()
class ChangeOrderStatusRequest {
  @JsonKey(name: 'parcels_ids')
  final List<int> ids;
  final String status;
  final String? notes;
  @JsonKey(name: 'unable_delivery_type_id')
  final String? unableDeliveryTypeId;

  ChangeOrderStatusRequest({
    required this.ids,
    required this.status,
    this.notes,
    this.unableDeliveryTypeId,
  });

  Map<String, dynamic> toJson() => _$ChangeOrderStatusRequestToJson(this);
}
