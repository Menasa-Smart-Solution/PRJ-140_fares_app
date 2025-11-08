import 'package:equatable/equatable.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/home/data/models/notifications_response_model.dart';
import 'package:fares/features/driver/home/data/repositories/home_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({
    required InternetService internetService,
    required HomeRepo homeRepo,
  }) : _internetService = internetService,
       _homeRepo = homeRepo,
       super(const NotificationsState());

  final InternetService _internetService;
  final HomeRepo _homeRepo;

  Future<void> getAllNotifications({bool isLoadMore = false}) async {
    // Prevent duplicate calls
    if (state.notificationState == StateType.loading) return;
    if (isLoadMore && (state.isLoadingMore || !state.hasMoreData)) return;

    final currentPage = isLoadMore ? state.currentPage + 1 : 1;

    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      emit(
        state.copyWith(
          notificationState: StateType.loading,
          currentPage: 1,
          hasMoreData: true,
          notifications: [],
        ),
      );
    }

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          notificationState: StateType.noInternet,
          isLoadingMore: false,
        ),
      );
      return;
    }

    final result = await _homeRepo.getAllNotifications(
      page: currentPage,
      perPage: 10,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            notificationState: isLoadMore
                ? state.notificationState
                : StateType.error,
            errorMessage: failure.message,
            isLoadingMore: false,
          ),
        );
      },
      (response) {
        final notificationItems = response.notificationData.notifications;
        final allNotifications = isLoadMore
            ? [...state.notifications, ...notificationItems]
            : notificationItems;
        final hasMoreData =
            response.notificationData.currentPage <
            response.notificationData.lastPage;

        emit(
          state.copyWith(
            notificationState: allNotifications.isEmpty
                ? StateType.empty
                : StateType.success,
            notifications: allNotifications,
            currentPage: currentPage,
            hasMoreData: hasMoreData,
            isLoadingMore: false,
          ),
        );
      },
    );
  }
}
