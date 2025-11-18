import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(checked: true)
class UserModel {
  final int id;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? type;

  UserModel({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.type,
    this.ownerName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
