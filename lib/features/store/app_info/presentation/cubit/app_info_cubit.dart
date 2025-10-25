import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/store/app_info/data/models/contact_us_response_model.dart';
import 'package:fares/features/store/app_info/data/repo/app_info_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_info_state.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  final InternetService _internetService;
  final AppInfoRepo _appInfoRepo;
  AppInfoCubit(this._internetService, this._appInfoRepo)
    : super(const AppInfoState());

  Future<void> getContactUsInfo() async {
    emit(
      state.copyWith(getContactUsState: StateType.loading, errorMessage: null),
    );
    final isConnected = await _internetService.isConnected();
    if (!isConnected) {
      emit(state.copyWith(getContactUsState: StateType.noInternet));
      return;
    }

    final contactUsInfo = await _appInfoRepo.getContactUsInfo();
    contactUsInfo.fold(
      (failure) {
        emit(
          state.copyWith(
            getContactUsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getContactUsState: StateType.success,
            contactUsInfo: response.data,
          ),
        );
      },
    );
  }

  Future<void> getPrivacyPolicyInfo() async {
    emit(
      state.copyWith(
        getPrivacyPolicyState: StateType.loading,
        errorMessage: null,
      ),
    );
    final isConnected = await _internetService.isConnected();
    if (!isConnected) {
      emit(state.copyWith(getPrivacyPolicyState: StateType.noInternet));
      return;
    }

    final privacyPolicyInfo = await _appInfoRepo.getPrivacyPolicyInfo();
    privacyPolicyInfo.fold(
      (failure) {
        emit(
          state.copyWith(
            getPrivacyPolicyState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getPrivacyPolicyState: StateType.success,
            privacyPolicy: response.data.privacyPolicy,
          ),
        );
      },
    );
  }
}
