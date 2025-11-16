import 'package:fares/core/helpers/helper_func.dart';
import 'package:json_annotation/json_annotation.dart';
part 'call_images_response.g.dart';

@JsonSerializable(checked: true)
class CallImagesResponse {
  final List<CallImageModel> images;

  CallImagesResponse({required this.images});

  factory CallImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$CallImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CallImagesResponseToJson(this);
}

@JsonSerializable(checked: true)
class CallImageModel {
  @StringConverter()
  final String id;
  @JsonKey(name: 'image_path')
  final String imagePath;

  CallImageModel({required this.id, required this.imagePath});

  factory CallImageModel.fromJson(Map<String, dynamic> json) =>
      _$CallImageModelFromJson(json);
}
