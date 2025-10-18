import 'package:fares/core/helpers/show_snackbar.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';

class SendOtpBlocListener extends StatelessWidget {
  const SendOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current.sendOtpState != previous.sendOtpState,
      listener: (context, state) {
        if (state.sendOtpState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          context.pushReplacementNamed(
            Routes.verificationCodeRoute,
            arguments: state.email,
          );
          showSnackBar(message: state.successMessage!, type: SnackType.success);
        } else if (state.sendOtpState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.sendOtpState.isError) {
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
