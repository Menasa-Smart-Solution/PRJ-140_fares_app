import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/helpers/show_snackbar.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/core/utils/prefs_keys.dart';
import 'package:fares/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state.type.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.type.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          await CacheHelper.setSecuredString(
            PrefsKeys.token,
            state.userModel!.token,
          );
          await CacheHelper.setSecuredString(
            PrefsKeys.role,
            state.userModel!.user.type,
          );
          if (!context.mounted) return;
          context.pushNamedAndRemoveUntil(
            Routes.mainDriverRoute,
            predicate: (_) => false,
          );
          showSnackBar(
            message: LocaleKeys.loginSuccess.tr(),
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
