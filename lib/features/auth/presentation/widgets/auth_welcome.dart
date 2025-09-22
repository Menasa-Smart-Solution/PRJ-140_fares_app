import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AuthWelcome extends StatelessWidget {
  const AuthWelcome({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFadeInDown(
          duration: 400,
          child: Image.asset(AppImages.imagesAppLogo, height: 95, width: 95),
        ),
        verticalSpace(32),
        CustomFadeInLeft(
          duration: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.bold24),
              Text(
                subtitle,
                style: AppTextStyles.reg16.copyWith(
                  color: AppColors.inActiveButton,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
