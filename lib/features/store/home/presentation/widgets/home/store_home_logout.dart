part of '../../../features_imports.dart';

class StoreHomeLogout extends StatelessWidget {
  const StoreHomeLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreHomeCubit, StoreHomeState>(
      listenWhen: (previous, current) =>
          previous.logOutState != current.logOutState,
      listener: (context, state) async {
        AppLogger.log('Logout state changed: ${state.logOutState}');

        if (state.logOutState == StateType.success) {
          AppLogger.log('Logout success - navigating to login');
          OverlayHelper.hideLoadingOverlay();
          await CacheHelper.clearAllSecuredData();
          if (!context.mounted) return;
          context.pushNamedAndRemoveUntil(
            Routes.loginRoute,
            predicate: (route) => false,
          );
          showSnackBar(
            message: 'تم تسجيل الخروج بنجاح',
            type: SnackType.success,
          );
        } else if (state.logOutState == StateType.loading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.logOutState == StateType.error) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.logOutState == StateType.noInternet) {
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
