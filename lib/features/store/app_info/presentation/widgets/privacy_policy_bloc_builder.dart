part of '../../feature_imports.dart';

class PrivacyPolicyBlocBuilder extends StatelessWidget {
  const PrivacyPolicyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInfoCubit, AppInfoState>(
      buildWhen: (previous, current) =>
          current.getPrivacyPolicyState != previous.getPrivacyPolicyState,
      builder: (context, state) {
        switch (state.getPrivacyPolicyState) {
          case StateType.loading:
            return const Center(child: CustomLoading());
          case StateType.success:
            return SingleChildScrollView(
              child: Text(
                state.privacyPolicy ?? '',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.black,
                  height: 1.5,
                ),
              ),
            );
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<AppInfoCubit>().getPrivacyPolicyInfo();
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
                context.read<AppInfoCubit>().getPrivacyPolicyInfo();
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
