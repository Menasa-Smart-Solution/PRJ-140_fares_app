import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/features/auth/data/models/reset_password_request_model.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/views/change_password_view.dart';
import 'package:fares/features/auth/presentation/widgets/change_password/change_password_bloc_listener.dart';
import 'package:fares/features/auth/presentation/widgets/change_password/new_password_text_form_field.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key, required this.params});
  final ChangePasswordParams params;
  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                LocaleKeys.changePassword.tr(),
                style: AppTextStyles.bold24,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 500,
              child: Text(
                LocaleKeys.changePasswordInstruction.tr(),
                style: AppTextStyles.reg16.copyWith(
                  color: AppColors.inActiveButton,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(32)),
          const SliverToBoxAdapter(child: ChangePasswordBlocListener()),
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 600,
              child: NewPasswordTextFromField(
                newPasswordController: _newPasswordController,
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverToBoxAdapter(
            child: CustomFadeInLeft(
              duration: 700,
              child: PasswordFormField(
                passwordController: _confirmPasswordController,
                title: LocaleKeys.confirmPasswordLabel.tr(),
                hintText: LocaleKeys.passwordHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  if (value != _newPasswordController.text) {
                    return LocaleKeys.passwordsDoNotMatch.tr();
                  }
                  return null;
                },
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomFadeInUp(
                duration: 800,
                child: AppTextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ForgetPasswordCubit>().resetPassword(
                        ResetPasswordRequestModel(
                          email: widget.params.email,
                          otp: widget.params.otp,
                          password: _newPasswordController.text,
                          passwordConfirmation: _confirmPasswordController.text,
                        ),
                      );
                    }
                  },
                  text: LocaleKeys.changeButton.tr(),
                ),
              ).withPadding(bottom: 50),
            ),
          ),
        ],
      ),
    );
  }
}
