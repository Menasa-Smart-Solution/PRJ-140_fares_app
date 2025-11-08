part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final StateType notificationState;
  final List<NotificationModel> notifications;
  final String? errorMessage;
  final int currentPage;
  final bool hasMoreData;
  final bool isLoadingMore;

  const NotificationsState({
    this.notificationState = StateType.initial,
    this.notifications = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.hasMoreData = true,
    this.isLoadingMore = false,
  });

  NotificationsState copyWith({
    StateType? notificationState,
    List<NotificationModel>? notifications,
    String? errorMessage,
    int? currentPage,
    bool? hasMoreData,
    bool? isLoadingMore,
  }) {
    return NotificationsState(
      notificationState: notificationState ?? this.notificationState,
      notifications: notifications ?? this.notifications,
      errorMessage: errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [
    notificationState,
    notifications,
    errorMessage,
    currentPage,
    hasMoreData,
    isLoadingMore,
  ];
}
