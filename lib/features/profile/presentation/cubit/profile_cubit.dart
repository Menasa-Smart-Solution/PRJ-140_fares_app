import 'package:equatable/equatable.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/profile/data/models/user_response_model.dart';
import 'package:fares/features/profile/data/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final InternetService _internetService;
  final ProfileRepo _repo;
  ProfileCubit(this._internetService, this._repo) : super(const ProfileState());

  Future<void> getUserInfo() async {
    emit(state.copyWith(getUserInfo: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getUserInfo: StateType.noInternet));
      return;
    }
    final result = await _repo.getUserInfo();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getUserInfo: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (userModel) {
        emit(
          state.copyWith(
            getUserInfo: StateType.success,
            userModel: userModel.user,
          ),
        );
      },
    );
  }

  Future<void> userLogout() async {
    emit(state.copyWith(logoutUser: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(logoutUser: StateType.noInternet));
      return;
    }
    final result = await _repo.userLogout();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            logoutUser: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(logoutUser: StateType.success));
      },
    );
  }
}
