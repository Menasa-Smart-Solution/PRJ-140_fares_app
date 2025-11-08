import 'package:equatable/equatable.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/home/data/models/store_home_response_model.dart';
import 'package:fares/features/store/home/data/repo/home_store_repo.dart';

part 'store_home_state.dart';

class StoreHomeCubit extends Cubit<StoreHomeState> {
  final HomeStoreRepo _homeStoreRepo;
  final InternetService _internetService;
  StoreHomeCubit(this._homeStoreRepo, this._internetService)
    : super(const StoreHomeState());

  Future<void> getStoreHome() async {
    emit(state.copyWith(getStoreHomeState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getStoreHomeState: StateType.noInternet));
      return;
    }
    final result = await _homeStoreRepo.getStoreHome();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getStoreHomeState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        emit(
          state.copyWith(
            getStoreHomeState: StateType.success,
            storeHome: result.data,
          ),
        );
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(logOutState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(logOutState: StateType.noInternet));
      return;
    }
    final result = await _homeStoreRepo.logout();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            logOutState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        AppLogger.log('Store Home Cubit: log out success');
        emit(state.copyWith(logOutState: StateType.success));
      },
    );
  }
}
