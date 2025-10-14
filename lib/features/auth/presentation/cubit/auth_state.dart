part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final StateType type;
  final AuthModel? userModel;
  final String? errorMessage;

  const AuthState({
    this.type = StateType.initial,
    this.userModel,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [type, userModel, errorMessage];

  AuthState copyWith({
    StateType? type,
    AuthModel? userModel,
    String? errorMessage,
  }) {
    return AuthState(
      type: type ?? this.type,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
