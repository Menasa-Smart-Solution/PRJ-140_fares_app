import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation_messages_response_model.g.dart';

@JsonSerializable(checked: true)
class ConversationMessagesResponseModel {
  final ConversationMessagesDataModel? data;

  factory ConversationMessagesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ConversationMessagesResponseModelFromJson(json);

  ConversationMessagesResponseModel({required this.data});
}

@JsonSerializable(checked: true)
class ConversationMessagesDataModel {
  final ConversationMessagesModel? chat;

  ConversationMessagesDataModel({required this.chat});

  factory ConversationMessagesDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationMessagesDataModelFromJson(json);
}

@JsonSerializable(checked: true)
class ConversationMessagesModel {
  final int? id;
  @JsonKey(name: "branch_id")
  @NullableStringConverter()
  final String? branchId;

  @JsonKey(name: "store_id")
  @NullableStringConverter()
  final String? storeId;
  @JsonKey(name: "parcel_id")
  @NullableStringConverter()
  final String? parcelId;
  @JsonKey(name: "last_message_id")
  @NullableStringConverter()
  final String? lastMessageId;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  final List<MessageModel>? messages;
  static int? _priceFromJson(dynamic v) => v == null
      ? null
      : v is String
      ? int.tryParse(v)
      : (v as num?)?.toInt();

  ConversationMessagesModel({
    this.id,
    this.branchId,
    this.storeId,
    this.parcelId,
    this.lastMessageId,
    this.createdAt,
    this.updatedAt,
    this.messages,
  });

  factory ConversationMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationMessagesModelFromJson(json);
}
