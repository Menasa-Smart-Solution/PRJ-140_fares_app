import 'package:fares/core/helpers/show_snackbar.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/views/change_password_view.dart';
import 'package:flutter/material.dart';

class VerifyCodeBlocListener extends StatelessWidget {
  const VerifyCodeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current.verifyOtpState != previous.verifyOtpState,
      listener: (context, state) {
        if (state.verifyOtpState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          context.pushReplacementNamed(
            Routes.changePasswordRoute,
            arguments: ChangePasswordParams(
              email: state.email!,
              otp: state.otp!,
            ),
          );
          showSnackBar(message: state.successMessage!, type: SnackType.success);
        } else if (state.verifyOtpState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.verifyOtpState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: state.errorMessage ?? 'An error occurred',
            type: SnackType.error,
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
