import 'package:json_annotation/json_annotation.dart';
part 'user_response_model.g.dart';

@JsonSerializable(checked: true)
class UserResponseModel {
  @JsonKey(name: 'data')
  final UserModel user;

  UserResponseModel({required this.user});
  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class UserModel {
  final int id;
  final String name;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  final String? phone;
  final String? phone2;
  final String address;
  final String type;

  UserModel({
    required this.id,
    required this.name,
    this.ownerName,
    this.phone,
    this.phone2,
    required this.address,
    required this.type,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
