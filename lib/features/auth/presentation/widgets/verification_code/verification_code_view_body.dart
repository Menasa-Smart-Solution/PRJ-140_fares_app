import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/features/auth/presentation/widgets/verification_code/otp_pin_input.dart';
import 'package:fares/features/auth/presentation/widgets/verification_code/otp_resend_code.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class VerificationCodeViewBody extends StatefulWidget {
  const VerificationCodeViewBody({super.key});

  @override
  State<VerificationCodeViewBody> createState() =>
      _VerificationCodeViewBodyState();
}

class _VerificationCodeViewBodyState extends State<VerificationCodeViewBody> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            child: Text("john@example.com", style: AppTextStyles.bold16),
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
        SliverToBoxAdapter(
          child: CustomFadeInUp(
            duration: 800,
            child: OtpResendCode(email: "john@example.com"),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: CustomFadeInUp(
            duration: 900,
            child: Align(
              alignment: Alignment.center,
              child: AppTextButton(
                onPressed: () {},
                text: LocaleKeys.verify.tr(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
