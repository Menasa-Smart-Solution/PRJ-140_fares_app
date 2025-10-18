import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:fares/core/helpers/app_regx.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/features/auth/data/models/register_request_model.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/auth_welcome.dart';
import 'package:fares/features/auth/presentation/widgets/have_or_dont_have_account.dart';
import 'package:fares/features/auth/presentation/widgets/login/auth_bloc_listener.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:fares/features/auth/presentation/widgets/register/branches_bloc_builder.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phoneTwoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _storeManagerNameController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _phoneTwoController.dispose();
    _addressController.dispose();
    _storeManagerNameController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                hintText: LocaleKeys.storeNameHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                },
                title: LocaleKeys.storeName.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 700,
              child: AppTextFormField(
                controller: _storeManagerNameController,
                hintText: LocaleKeys.storeManagerNameHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                },
                title: LocaleKeys.storeManagerName.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 800,
              child: AppTextFormField(
                controller: _emailController,
                hintText: LocaleKeys.emailPhoneHint.tr(),
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
              duration: 900,
              child: AppTextFormField(
                controller: _phoneController,
                hintText: LocaleKeys.phoneHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  } else if (!AppRegex.isPhoneNumberValid(value)) {
                    return LocaleKeys.phoneNumberInvalid.tr();
                  }
                  return null;
                },
                title: LocaleKeys.phone.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 1000,
              child: AppTextFormField(
                controller: _phoneTwoController,
                hintText: LocaleKeys.phone2Hint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  } else if (!AppRegex.isPhoneNumberValid(value)) {
                    return LocaleKeys.phoneNumberInvalid.tr();
                  }
                  return null;
                },
                title: LocaleKeys.phone2.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 1100,
              child: AppTextFormField(
                controller: _addressController,
                hintText: LocaleKeys.storeLocationHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  return null;
                },
                title: LocaleKeys.storeLocation.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 1200,
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
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 1300,
              child: PasswordFormField(
                passwordController: _confirmPasswordController,
                title: LocaleKeys.confirmPasswordLabel.tr(),
                hintText: LocaleKeys.passwordHint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  } else if (value != _passwordController.text) {
                    return LocaleKeys.passwordsDoNotMatch.tr();
                  }
                  return null;
                },
              ),
            ),
            verticalSpace(20),
            const AuthBlocListener(),
            const CustomFadeInLeft(
              duration: 1400,
              child: BranchesBlocBuilder(),
            ),
            verticalSpace(32),
            CustomFadeInUp(
              duration: 1500,
              child: AppTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().register(
                      RegisterRequestModel(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        passwordConfirmation: _confirmPasswordController.text,
                        phone: _phoneController.text,
                        phone2: _phoneTwoController.text,
                        address: _addressController.text,
                        ownerName: _storeManagerNameController.text,
                      ),
                    );
                  }
                },
                text: LocaleKeys.createAccount.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInUp(
              duration: 1600,
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
      ),
    );
  }
}
