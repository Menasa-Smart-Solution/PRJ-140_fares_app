import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/features/auth/presentation/widgets/auth_welcome.dart';
import 'package:fares/features/auth/presentation/widgets/have_or_dont_have_account.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(50),
          AuthWelcome(
            title: LocaleKeys.createNewAccount.tr(),
            subtitle: LocaleKeys.registerSubtitle.tr(),
          ),
          verticalSpace(32),
          CustomFadeInLeft(
            duration: 600,
            child: AppTextFormField(
              controller: _nameController,
              hintText: LocaleKeys.nameHint.tr(),
              validator: (value) {},
              title: LocaleKeys.fullNameLabel.tr(),
            ),
          ),
          verticalSpace(16),
          CustomFadeInLeft(
            duration: 700,
            child: AppTextFormField(
              controller: _emailController,
              hintText: LocaleKeys.emailPhoneHint.tr(),
              validator: (value) {},
              title: LocaleKeys.emailPhoneLabel.tr(),
            ),
          ),
          verticalSpace(16),
          CustomFadeInLeft(
            duration: 800,
            child: PasswordFormField(
              passwordController: _passwordController,
              title: LocaleKeys.passwordLabel.tr(),
              hintText: LocaleKeys.passwordHint.tr(),
              validator: (value) {},
            ),
          ),
          verticalSpace(16),
          CustomFadeInLeft(
            duration: 900,
            child: PasswordFormField(
              passwordController: _confirmPasswordController,
              title: LocaleKeys.confirmPasswordLabel.tr(),
              hintText: LocaleKeys.passwordHint.tr(),
              validator: (value) {},
            ),
          ),
          verticalSpace(32),
          CustomFadeInUp(
            duration: 1000,
            child: AppTextButton(
              onPressed: () {
                context.pushNamed(Routes.verificationCodeRoute);
              },
              text: LocaleKeys.createAccount.tr(),
            ),
          ),
          verticalSpace(16),
          CustomFadeInUp(
            duration: 1100,
            child: HaveOrDontHaveAccount(
              text1: LocaleKeys.alreadyHaveAccount.tr(),
              text2: LocaleKeys.login.tr(),
              onTap: () {
                context.pushReplacementNamed(Routes.loginRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
