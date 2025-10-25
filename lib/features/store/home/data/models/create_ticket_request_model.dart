import 'package:json_annotation/json_annotation.dart';
part 'create_ticket_request_model.g.dart';

@JsonSerializable(checked: true)
class CreateTicketRequestModel {
  @JsonKey(name: 'parcel_id')
  final int parcelId;
  final String desc;

  CreateTicketRequestModel({required this.parcelId, required this.desc});

  Map<String, dynamic> toJson() => _$CreateTicketRequestModelToJson(this);
}
