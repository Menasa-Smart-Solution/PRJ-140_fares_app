import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:fares/core/helpers/app_regx.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/auth_welcome.dart';
import 'package:fares/features/auth/presentation/widgets/have_or_dont_have_account.dart';
import 'package:fares/features/auth/presentation/widgets/login/login_bloc_listener.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                AuthWelcome(
                  title: LocaleKeys.welcomeMessage.tr(),
                  subtitle: LocaleKeys.loginWelcome.tr(),
                ),
                verticalSpace(32),
                CustomFadeInLeft(
                  duration: 600,
                  child: AppTextFormField(
                    hintText: LocaleKeys.emailPhoneHint.tr(),
                    controller: _emailController,
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
                verticalSpace(16),
                CustomFadeInLeft(
                  duration: 700,
                  child: PasswordFormField(
                    passwordController: _passwordController,
                    title: LocaleKeys.passwordLabel.tr(),
                    hintText: LocaleKeys.passwordHint.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.fieldRequired.tr();
                      } else if (value.length < 8) {
                        return LocaleKeys.passwordMinLength.tr();
                      }
                      return null;
                    },
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.forgetPasswordRoute);
                    },
                    child: Text(
                      LocaleKeys.forgotPassword.tr(),
                      style: AppTextStyles.med12.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomFadeInUp(
                  duration: 900,
                  child: AppTextButton(
                    onPressed: () {
                      _validateThenLogin(context);
                    },
                    text: LocaleKeys.login.tr(),
                  ),
                ),
                const LoginBlocListener(),
                verticalSpace(16),
                CustomFadeInUp(
                  duration: 1000,
                  child: HaveOrDontHaveAccount(
                    text1: LocaleKeys.dontHaveAccount.tr(),
                    text2: LocaleKeys.createAccount.tr(),
                    onTap: () {
                      context.pushReplacementNamed(Routes.registerRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _validateThenLogin(BuildContext context) async {
    final cubit = context.read<AuthCubit>();
    if (_formKey.currentState!.validate()) {
      cubit.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }
}
