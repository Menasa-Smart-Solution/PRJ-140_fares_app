part of '../widgets.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state.logOutState.isSuccess) {
          await CacheHelper.clearAllSecuredData();
          if (!context.mounted) return;
          OverlayHelper.hideLoadingOverlay();
          context.pushReplacementNamed(Routes.loginRoute);
          showSnackBar(
            message: 'تم تسجيل الخروج بنجاح',
            type: SnackType.success,
          );
        } else if (state.logOutState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.logOutState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.logOutState.isNoInternet) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: LocaleKeys.noNetworkConnection.tr(),
            type: SnackType.warning,
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
