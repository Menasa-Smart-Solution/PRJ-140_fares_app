import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/overlay_helper.dart';
import 'package:fares/core/helpers/show_snackbar.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.type.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.type.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          context.pushNamedAndRemoveUntil(
            Routes.mainDriverRoute,
            predicate: (_) => false,
          );
          showSnackBar(
            message: "تم تسجيل الدخول بنجاح",
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
