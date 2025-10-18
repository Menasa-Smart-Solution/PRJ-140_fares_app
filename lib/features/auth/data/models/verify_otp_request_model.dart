import 'package:json_annotation/json_annotation.dart';
part 'verify_otp_request_model.g.dart';

@JsonSerializable()
class VerifyOtpRequestModel {
  final String email;
  final String otp;

  VerifyOtpRequestModel({required this.email, required this.otp});

  Map<String, dynamic> toJson() => _$VerifyOtpRequestModelToJson(this);
}
