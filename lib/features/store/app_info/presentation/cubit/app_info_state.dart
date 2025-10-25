part of 'app_info_cubit.dart';

class AppInfoState extends Equatable {
  final StateType getContactUsState;
  final List<ContactUsModel> contactUsInfo;
  final String? errorMessage;

  const AppInfoState({
    this.getContactUsState = StateType.loading,
    this.contactUsInfo = const [],
    this.errorMessage,
  });
  @override
  List<Object?> get props => [getContactUsState, contactUsInfo, errorMessage];

  AppInfoState copyWith({
    StateType? getContactUsState,
    List<ContactUsModel>? contactUsInfo,
    String? errorMessage,
  }) {
    return AppInfoState(
      getContactUsState: getContactUsState ?? this.getContactUsState,
      contactUsInfo: contactUsInfo ?? this.contactUsInfo,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
