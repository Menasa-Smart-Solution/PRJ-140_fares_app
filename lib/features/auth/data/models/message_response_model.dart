import 'package:json_annotation/json_annotation.dart';
part 'message_response_model.g.dart';

@JsonSerializable()
class MessageResponseModel {
  @JsonKey(name: 'data')
  final MessageResultModel result;

  MessageResponseModel({required this.result});

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseModelFromJson(json);
}

@JsonSerializable()
class MessageResultModel {
  final String message;

  MessageResultModel({required this.message});

  factory MessageResultModel.fromJson(Map<String, dynamic> json) =>
      _$MessageResultModelFromJson(json);
}
