import 'package:json_annotation/json_annotation.dart';
part 'register_request_model.g.dart';

@JsonSerializable(checked: true)
class RegisterRequestModel {
  final String name;
  @JsonKey(name: 'owner_name')
  final String ownerName;
  final String email;
  final String phone;
  final String phone2;
  final String address;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @JsonKey(name: 'branch_id')
  final int? branchId;

  RegisterRequestModel({
    required this.name,
    required this.ownerName,
    required this.email,
    required this.phone,
    required this.phone2,
    required this.address,
    required this.password,
    required this.passwordConfirmation,
    this.branchId,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
