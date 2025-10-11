import 'package:json_annotation/json_annotation.dart';
part 'send_message_request_model.g.dart';

@JsonSerializable(checked: true)
class SendMessageRequestModel {
  @JsonKey(name: "details")
  final String message;
  @JsonKey(name: "parcel_id")
  final String parcelId;
  final String type;

  SendMessageRequestModel({
    required this.message,
    required this.parcelId,
    required this.type,
  });

  Map<String, dynamic> toJson() => _$SendMessageRequestModelToJson(this);
}
