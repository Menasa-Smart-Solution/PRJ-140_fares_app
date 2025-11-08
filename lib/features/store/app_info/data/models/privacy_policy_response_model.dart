import 'package:json_annotation/json_annotation.dart';
part 'privacy_policy_response_model.g.dart';

@JsonSerializable(checked: true)
class PrivacyPolicyResponseModel {
  final PrivacyPolicyModel data;

  PrivacyPolicyResponseModel({required this.data});

  factory PrivacyPolicyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class PrivacyPolicyModel {
  @JsonKey(name: 'privacy_policy')
  final String privacyPolicy;

  PrivacyPolicyModel({required this.privacyPolicy});
  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyModelFromJson(json);
}
