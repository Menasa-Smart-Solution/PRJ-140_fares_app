part of '../../feature_imports.dart';

class DeleteAccountBlocListener extends StatelessWidget {
  const DeleteAccountBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state.logoutUser.isSuccess) {
          await CacheHelper.clearAllSecuredData();
          if (!context.mounted) return;
          OverlayHelper.hideLoadingOverlay();
          context.pushReplacementNamed(Routes.loginRoute);
          showSnackBar(message: 'تم حذف الحساب بنجاح', type: SnackType.success);
        } else if (state.logoutUser.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.logoutUser.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.logoutUser.isNoInternet) {
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
