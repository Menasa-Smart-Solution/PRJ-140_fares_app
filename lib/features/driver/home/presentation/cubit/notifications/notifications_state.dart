part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<NotificationModel> notifications;
  final StateType notificationState;
  final String? errorMessage;

  const NotificationsState({
    this.notifications = const [],
    this.notificationState = StateType.loading,
    this.errorMessage,
  });

  NotificationsState copyWith({
    List<NotificationModel>? notifications,
    StateType? notificationState,
    String? errorMessage,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      notificationState: notificationState ?? this.notificationState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [notifications, notificationState, errorMessage];
}
