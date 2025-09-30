import 'package:fares/features/auth/data/models/user_model.dart' show UserModel;
import 'package:json_annotation/json_annotation.dart';
part 'auth_response_model.g.dart';

@JsonSerializable(checked: true)
class AuthResponseModel {
  final AuthModel data;

  AuthResponseModel({required this.data});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class AuthModel {
  final String token;
  final UserModel user;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  AuthModel({required this.token, required this.user});
}
