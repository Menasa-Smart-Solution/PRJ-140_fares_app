part of 'app_info_cubit.dart';

class AppInfoState extends Equatable {
  final StateType getContactUsState;
  final List<ContactUsModel> contactUsInfo;
  final String? errorMessage;
  final StateType getPrivacyPolicyState;
  final String? privacyPolicy;

  const AppInfoState({
    this.getContactUsState = StateType.loading,
    this.contactUsInfo = const [],
    this.errorMessage,
    this.getPrivacyPolicyState = StateType.loading,
    this.privacyPolicy,
  });
  @override
  List<Object?> get props => [
    getContactUsState,
    contactUsInfo,
    errorMessage,
    getPrivacyPolicyState,
    privacyPolicy,
  ];

  AppInfoState copyWith({
    StateType? getContactUsState,
    List<ContactUsModel>? contactUsInfo,
    String? errorMessage,
    StateType? getPrivacyPolicyState,
    String? privacyPolicy,
  }) {
    return AppInfoState(
      getContactUsState: getContactUsState ?? this.getContactUsState,
      contactUsInfo: contactUsInfo ?? this.contactUsInfo,
      errorMessage: errorMessage ?? this.errorMessage,

      getPrivacyPolicyState:
          getPrivacyPolicyState ?? this.getPrivacyPolicyState,
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
    );
  }
}
