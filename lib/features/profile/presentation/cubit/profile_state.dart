part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final StateType getUserInfo;
  final UserModel? userModel;
  final StateType logoutUser;
  final String? errorMessage;

  const ProfileState({
    this.getUserInfo = StateType.loading,
    this.userModel,
    this.logoutUser = StateType.initial,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [
    getUserInfo,
    userModel,
    logoutUser,
    errorMessage ?? '',
  ];

  ProfileState copyWith({
    StateType? getUserInfo,
    UserModel? userModel,
    StateType? logoutUser,
    String? errorMessage,
  }) {
    return ProfileState(
      getUserInfo: getUserInfo ?? this.getUserInfo,
      userModel: userModel ?? this.userModel,
      logoutUser: logoutUser ?? this.logoutUser,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
