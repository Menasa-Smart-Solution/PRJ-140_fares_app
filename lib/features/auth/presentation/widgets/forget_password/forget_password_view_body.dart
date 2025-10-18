import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:fares/core/helpers/app_regx.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/features/auth/data/models/send_otp_request_model.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/forget_password/send_otp_bloc_listener.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailPhoneController.dispose();
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
                LocaleKeys.forgotPassword.tr(),
                style: AppTextStyles.bold24,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: Text(
                LocaleKeys.forgotPasswordInstruction.tr(),
                style: AppTextStyles.reg16,
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(32)),
          SliverToBoxAdapter(
            child: CustomFadeInUp(
              duration: 600,
              child: AppTextFormField(
                hintText: LocaleKeys.emailPhoneHint.tr(),
                controller: _emailPhoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  } else if (!AppRegex.isEmailValid(value) &&
                      !AppRegex.isPhoneNumberValid(value)) {
                    return LocaleKeys.emailOrPhoneNumberInvalid.tr();
                  }
                  return null;
                },
                title: LocaleKeys.emailPhoneLabel.tr(),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SendOtpBlocListener()),
          SliverFillRemaining(
            hasScrollBody: false,
            child: CustomFadeInUp(
              duration: 700,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppTextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ForgetPasswordCubit>().sendOtp(
                        SendOtpRequestModel(
                          email: _emailPhoneController.text.trim(),
                        ),
                      );
                    }
                  },
                  text: LocaleKeys.continueButton.tr(),
                ),
              ).withPadding(bottom: 50),
            ),
          ),
        ],
      ),
    );
  }
}
