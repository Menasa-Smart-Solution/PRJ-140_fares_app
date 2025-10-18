import 'package:json_annotation/json_annotation.dart';
part 'register_response_model.g.dart';

@JsonSerializable(checked: true)
class RegisterResponseModel {
  final RegisterModel data;

  RegisterResponseModel({required this.data});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class RegisterModel {
  final String token;
  final UserStoreModel user;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  RegisterModel({required this.token, required this.user});
}

@JsonSerializable(checked: true)
class UserStoreModel {
  final int id;
  @JsonKey(name: 'owner_name')
  final String ownerName;
  final String name;
  final String email;
  final String phone;
  final String address;

  UserStoreModel({
    required this.id,
    required this.ownerName,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
  factory UserStoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserStoreModelFromJson(json);
}
