import 'package:json_annotation/json_annotation.dart';
part 'send_otp_request_model.g.dart';

@JsonSerializable(checked: true)
class SendOtpRequestModel {
  final String email;

  SendOtpRequestModel({required this.email});

  Map<String, dynamic> toJson() => _$SendOtpRequestModelToJson(this);
}
