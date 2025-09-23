import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPinInput extends StatelessWidget {
  const OtpPinInput({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 54,
      height: 54,

      textStyle: AppTextStyles.med20,
      decoration: BoxDecoration(
        color: AppColors.greyWhite,
        borderRadius: BorderRadius.circular(14), // 🟢 Rounded corners
        border: Border.all(color: AppColors.grey200), // 🟢 Rounded corners
      ),
    );

    return FormField<String>(
      validator: (value) {
        // if (controller.text.isEmpty) {
        //   return LocaleKeys.pleaseEnterverificationCode.tr();
        // }
        // if (controller.text.length < 6) {
        //   return LocaleKeys.verificationCodeLengthValidation.tr();
        // }
        return null;
      },
      builder: (state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Pinput(
              controller: controller,
              forceErrorState: true,
              length: 4,
              validator: (pin) {
                if (pin == '2224') return null;

                /// Text will be displayed under the Pinput
                return 'Pin is incorrect';
              },
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
              ),
              submittedPinTheme: defaultPinTheme,
            ),
            if (state.hasError) ...[
              verticalSpace(8),
              Text(
                state.errorText!,
                style: AppTextStyles.med14.copyWith(color: Colors.red),
              ),
            ],
          ],
        );
      },
    );
  }
}
