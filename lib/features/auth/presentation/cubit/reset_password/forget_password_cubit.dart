import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/auth/data/models/reset_password_request_model.dart';
import 'package:fares/features/auth/data/models/send_otp_request_model.dart';
import 'package:fares/features/auth/data/models/verify_otp_request_model.dart';
import 'package:fares/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo _authRepo;
  ForgetPasswordCubit(this._authRepo) : super(const ForgetPasswordState());

  Future<void> sendOtp(SendOtpRequestModel body) async {
    emit(state.copyWith(sendOtpState: StateType.loading));
    final result = await _authRepo.sendOtp(body);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            sendOtpState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            sendOtpState: StateType.success,
            successMessage: response.result.message,
            email: body.email,
          ),
        );
      },
    );
  }

  Future<void> verifyOtp(VerifyOtpRequestModel body) async {
    emit(state.copyWith(verifyOtpState: StateType.loading));
    final result = await _authRepo.verifyOtp(body);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            verifyOtpState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            verifyOtpState: StateType.success,
            otp: body.otp,
            email: body.email,
            successMessage: response.result.message,
          ),
        );
      },
    );
  }

  Future<void> resetPassword(ResetPasswordRequestModel body) async {
    emit(state.copyWith(resetPasswordState: StateType.loading));
    final result = await _authRepo.resetPassword(body);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            resetPasswordState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            resetPasswordState: StateType.success,
            successMessage: response.result.message,
          ),
        );
      },
    );
  }
}
