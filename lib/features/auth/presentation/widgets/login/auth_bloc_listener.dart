import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/core/utils/prefs_keys.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_state.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state.type.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.type.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          if (state.isRegistered) {
            if (!context.mounted) return;
            context.pushNamedAndRemoveUntil(
              Routes.loginRoute,
              predicate: (_) => false,
            );
            showSnackBar(
              message: state.successMessage ?? 'Success',
              type: SnackType.success,
            );
            return;
          }
          await CacheHelper.setSecuredString(
            PrefsKeys.role,
            state.userModel!.user.type ?? '',
          );
          await CacheHelper.setSecuredString(
            PrefsKeys.address,
            state.userModel!.user.address ?? '',
          );
          await CacheHelper.setSecuredString(
            PrefsKeys.phone,
            state.userModel!.user.phone ?? '',
          );
          await CacheHelper.setSecuredString(
            PrefsKeys.token,
            state.isRegistered
                ? state.registeredUser!.token
                : state.userModel!.token,
          );
          if (!context.mounted) return;
          context.pushNamedAndRemoveUntil(
            state.userModel!.user.type == "store"
                ? Routes.mainStoreRoute
                : Routes.mainDriverRoute,
            predicate: (_) => false,
          );
          showSnackBar(
            message: state.successMessage ?? 'Success',
            type: SnackType.success,
          );
        } else if (state.type.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        }
      },
      child: const SizedBox(),
    );
  }
}
