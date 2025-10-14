import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request_model.g.dart';

@JsonSerializable(checked: true)
class ResetPasswordRequestModel {
  final String email;
  final String otp;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  ResetPasswordRequestModel({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordRequestModelToJson(this);
}
