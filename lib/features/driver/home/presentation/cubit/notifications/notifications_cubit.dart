import 'package:equatable/equatable.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/app_logger.dart';
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

  Future<void> getAllNotifications() async {
    emit(state.copyWith(notificationState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(notificationState: StateType.noInternet));
      return;
    }
    final result = await _homeRepo.getAllNotifications();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            notificationState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        AppLogger.log('Notifications: ${response.notifications}');

        emit(
          state.copyWith(
            notificationState: StateType.success,
            notifications: response.notifications,
          ),
        );
      },
    );
  }
}
