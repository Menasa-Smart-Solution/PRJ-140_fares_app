import 'package:json_annotation/json_annotation.dart';

part 'contact_us_response_model.g.dart';

@JsonSerializable(checked: true)
class ContactUsResponseModel {
  final List<ContactUsModel> data;

  ContactUsResponseModel({required this.data});

  factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class ContactUsModel {
  final int id;
  final String name;
  final String? phone;
  @JsonKey(name: 'phone_2')
  final String? phone2;
  final String address;

  ContactUsModel({
    required this.id,
    required this.name,
    this.phone,
    this.phone2,
    required this.address,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);
}
