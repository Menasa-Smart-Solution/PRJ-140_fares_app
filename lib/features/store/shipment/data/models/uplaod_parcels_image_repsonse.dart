import 'package:json_annotation/json_annotation.dart';
part 'uplaod_parcels_image_repsonse.g.dart';

@JsonSerializable(checked: true)
class UploadParcelsImageResponse {
  @JsonKey(name: 'image_path')
  final String imageUrl;

  UploadParcelsImageResponse({required this.imageUrl});

  factory UploadParcelsImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadParcelsImageResponseFromJson(json);
}
