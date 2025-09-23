import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(LocaleKeys.oneLowerCaseLatter.tr(), hasLowerCase),
        verticalSpace(2),
        buildValidationRow(LocaleKeys.oneUppercaseLatter.tr(), hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
          LocaleKeys.oneSpecialLatter.tr(),
          hasSpecialCharacter,
        ),
        verticalSpace(2),
        buildValidationRow(LocaleKeys.atLeastOneNumber.tr(), hasNumber),
        verticalSpace(2),
        buildValidationRow(LocaleKeys.eightCharacterLong.tr(), hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        hasValidated
            ? const Icon(
                Icons.check,
                color: AppColors.lightPrimaryColor,
                size: 12,
              )
            : const CircleAvatar(
                radius: 2.5,
                backgroundColor: AppColors.grey500,
              ),
        horizontalSpace(6),
        Text(
          text,
          style: AppTextStyles.med12.copyWith(
            decorationColor: hasValidated ? AppColors.grey500 : null,
            decoration: hasValidated
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            color: hasValidated
                ? AppColors.lightPrimaryColor
                : AppColors.grey500,
          ),
        ),
      ],
    );
  }
}
