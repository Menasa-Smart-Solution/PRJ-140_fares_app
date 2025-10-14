import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/features/auth/data/models/verify_otp_request_model.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/forget_password/send_otp_bloc_listener.dart';
import 'package:fares/features/auth/presentation/widgets/verification_code/otp_pin_input.dart';
import 'package:fares/features/auth/presentation/widgets/verification_code/otp_resend_code.dart';
import 'package:fares/features/auth/presentation/widgets/verification_code/verify_code_bloc_listener.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeViewBody extends StatefulWidget {
  const VerificationCodeViewBody({super.key, required this.email});
  final String email;

  @override
  State<VerificationCodeViewBody> createState() =>
      _VerificationCodeViewBodyState();
}

class _VerificationCodeViewBodyState extends State<VerificationCodeViewBody> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 400,
              child: Text(
                LocaleKeys.verificationCode.tr(),
                style: AppTextStyles.extraBold24,
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(8)),
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,

              child: Text(
                LocaleKeys.verificationInstruction.tr(),
                style: AppTextStyles.reg16.copyWith(
                  color: AppColors.inActiveButton,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(12)),
          SliverToBoxAdapter(
            child: CustomFadeInUp(
              duration: 600,
              child: Text(widget.email, style: AppTextStyles.bold16),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(40)),

          SliverToBoxAdapter(
            child: CustomFadeInDown(
              duration: 700,
              child: OtpPinInput(controller: _otpController),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(24)),
          const SliverToBoxAdapter(child: SendOtpBlocListener()),
          const SliverToBoxAdapter(child: VerifyCodeBlocListener()),
          SliverToBoxAdapter(
            child: CustomFadeInUp(
              duration: 800,
              child: OtpResendCode(email: widget.email),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: CustomFadeInUp(
              duration: 900,
              child: Align(
                alignment: Alignment.center,
                child: AppTextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ForgetPasswordCubit>().verifyOtp(
                        VerifyOtpRequestModel(
                          email: widget.email,
                          otp: _otpController.text,
                        ),
                      );
                    }
                  },
                  text: LocaleKeys.verify.tr(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
