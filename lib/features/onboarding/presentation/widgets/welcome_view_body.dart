import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/core/utils/app_images.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(100),
            CustomFadeInUp(
              duration: 400,
              child: Image.asset(
                AppImages.imagesAppLogo,
                width: 189,
                height: 191,
              ),
            ),
            // verticalSpace(8),
            CustomFadeInLeft(
              duration: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    LocaleKeys.appName.tr(),
                    style: AppTextStyles.font50W700,
                  ),
                  Text(
                    LocaleKeys.forDelivery.tr(),
                    style: AppTextStyles.font50W700.copyWith(
                      color: AppColors.tertiaryColor,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(64),
            CustomFadeInUp(
              duration: 600,
              child: AppTextButton(
                onPressed: () {},
                text: LocaleKeys.createAccount.tr(),
              ),
            ),
            verticalSpace(16),
            CustomFadeInUp(
              duration: 700,
              child: AppTextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginRoute);
                },
                text: LocaleKeys.login.tr(),
                backgroundColor: Colors.transparent,
                borderColor: AppColors.primaryColor,
                textColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
