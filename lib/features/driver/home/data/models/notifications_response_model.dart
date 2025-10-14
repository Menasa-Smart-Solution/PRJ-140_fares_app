import 'package:json_annotation/json_annotation.dart';
part 'notifications_response_model.g.dart';

@JsonSerializable(checked: true)
class NotificationsResponseModel {
  @JsonKey(name: 'data')
  final List<NotificationModel> notifications;

  factory NotificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseModelFromJson(json);

  NotificationsResponseModel({required this.notifications});
}

@JsonSerializable(checked: true)
class NotificationModel {
  final int? id;
  final String? title;
  @JsonKey(name: 'user_id')
  final String? userId;
  final String? body;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'is_read')
  final String? isRead;

  NotificationModel({
    this.id,
    this.title,
    this.userId,
    this.body,
    this.createdAt,
    this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
