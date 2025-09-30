import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(checked: true)
class UserModel {
  final int id;
  @JsonKey(name: 'owner_name')
  final String? name;
  final String email;
  final String phone;
  final String address;
  final String type;

  UserModel({
    required this.id,
    this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
