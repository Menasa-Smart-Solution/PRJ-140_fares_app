import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveOrDontHaveAccount extends StatelessWidget {
  const HaveOrDontHaveAccount({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: AppTextStyles.reg14.copyWith(color: AppColors.grey500),
            ),
            TextSpan(
              text: text2,
              style: AppTextStyles.med14.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
