import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversations_response_model.g.dart';

@JsonSerializable(checked: true)
class ConversationsResponseModel {
  final ConversationsDataModel? data;

  factory ConversationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationsResponseModelFromJson(json);

  ConversationsResponseModel({required this.data});
}

@JsonSerializable(checked: true)
class ConversationsDataModel {
  final List<ConversationModel> chats;

  ConversationsDataModel({required this.chats});

  factory ConversationsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationsDataModelFromJson(json);
}

@JsonSerializable(checked: true)
class ConversationModel {
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
  @JsonKey(name: "store")
  final StoreModel? store;
  final ParcelModel? parcel;
  @JsonKey(name: "last_message")
  final MessageModel? lastMessage;

  ConversationModel({
    this.id,
    this.branchId,
    this.storeId,
    this.parcelId,
    this.lastMessageId,
    this.createdAt,
    this.updatedAt,
    this.store,
    this.parcel,
    this.lastMessage,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);
}

@JsonSerializable(checked: true)
class StoreModel {
  final int? id;
  @JsonKey(name: "branch_id")
  @NullableStringConverter()
  final String? branchId;
  @JsonKey(name: "parent_store_id")
  @NullableStringConverter()
  final String? parentStoreId;
  final String? name;
  @JsonKey(name: "owner_name")
  final String? ownerName;
  final String? email;
  final String? phone;
  final String? phone2;
  final String? address;

  StoreModel({
    this.id,
    this.branchId,
    this.parentStoreId,
    this.name,
    this.ownerName,
    this.email,
    this.phone,
    this.phone2,
    this.address,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

@JsonSerializable(checked: true)
class MessageModel {
  final int? id;
  @JsonKey(name: "branch_id")
  @NullableStringConverter()
  final String? branchId;
  @JsonKey(name: "chat_id")
  @NullableStringConverter()
  final String? chatId;
  @JsonKey(name: "store_id")
  @NullableStringConverter()
  final String? storeId;
  @JsonKey(name: "user_id")
  @NullableStringConverter()
  final String? userId;
  @JsonKey(name: "parcel_id")
  @NullableStringConverter()
  final String? parcelId;
  @JsonKey(name: "delivery_man_id")
  @NullableStringConverter()
  final String? deliveryManId;
  final String? details;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  MessageModel({
    this.id,
    this.branchId,
    this.chatId,
    this.storeId,
    this.userId,
    this.parcelId,
    this.deliveryManId,
    this.details,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
