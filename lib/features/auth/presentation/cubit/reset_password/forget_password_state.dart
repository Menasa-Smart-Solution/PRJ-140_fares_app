part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final StateType sendOtpState;
  final String? successMessage;
  final String? errorMessage;
  final StateType verifyOtpState;
  final StateType resetPasswordState;
  final String? email;
  final String? otp;

  const ForgetPasswordState({
    this.sendOtpState = StateType.initial,
    this.successMessage,
    this.errorMessage,
    this.verifyOtpState = StateType.initial,
    this.resetPasswordState = StateType.initial,
    this.email,
    this.otp,
  });

  ForgetPasswordState copyWith({
    StateType? sendOtpState,
    String? successMessage,
    String? errorMessage,
    StateType? verifyOtpState,
    StateType? resetPasswordState,
    String? email,
    String? otp,
  }) {
    return ForgetPasswordState(
      sendOtpState: sendOtpState ?? this.sendOtpState,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      verifyOtpState: verifyOtpState ?? this.verifyOtpState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [
    sendOtpState,
    successMessage,
    errorMessage,
    verifyOtpState,
    resetPasswordState,
    email,
    otp,
  ];
}
