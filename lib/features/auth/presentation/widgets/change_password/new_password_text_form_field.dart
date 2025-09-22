import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/helpers/app_regx.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/features/auth/presentation/widgets/change_password/password_validation.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class NewPasswordTextFromField extends StatefulWidget {
  const NewPasswordTextFromField({
    super.key,
    required this.newPasswordController,
  });
  final TextEditingController newPasswordController;
  @override
  State<NewPasswordTextFromField> createState() =>
      _NewPasswordTextFromFieldState();
}

class _NewPasswordTextFromFieldState extends State<NewPasswordTextFromField> {
  @override
  void initState() {
    super.initState();
    widget.newPasswordController.addListener(() {
      final password = widget.newPasswordController.text;
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(password);
        hasUpperCase = AppRegex.hasUpperCase(password);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
        hasNumber = AppRegex.hasNumber(password);
        hasMinLength = AppRegex.hasMinLength(password);
        progress =
            (hasLowerCase ? 1 : 0) +
            (hasUpperCase ? 1 : 0) +
            (hasSpecialCharacter ? 1 : 0) +
            (hasNumber ? 1 : 0) +
            (hasMinLength ? 1 : 0);
      });
    });
  }

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PasswordFormField(
          showError: false,
          hintText: "ادخل كلمة المرور",
          title: "كلمة المرور الجديدة",
          passwordController: widget.newPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.fieldRequired.tr();
            } else if (!AppRegex.hasLowerCase(value)) {
              return LocaleKeys.oneLowerCaseLatter.tr();
            } else if (!AppRegex.hasUpperCase(value)) {
              return LocaleKeys.oneUppercaseLatter.tr();
            } else if (!AppRegex.hasSpecialCharacter(value)) {
              return LocaleKeys.oneSpecialLatter.tr();
            } else if (!AppRegex.hasNumber(value)) {
              return LocaleKeys.atLeastOneNumber.tr();
            } else if (!AppRegex.hasMinLength(value)) {
              return LocaleKeys.eightCharacterLong.tr();
            }
          },
        ),
        verticalSpace(8),
        LinearProgressIndicator(
          value: progress / 5,
          backgroundColor: AppColors.grey200,
          color: AppColors.yellow500,
          borderRadius: BorderRadius.circular(3),
        ),
        verticalSpace(12),
        PasswordValidations(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasSpecialCharacter: hasSpecialCharacter,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }
}
