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
import 'package:flutter_svg/svg.dart';

class PasswordChangedSuccessView extends StatelessWidget {
  const PasswordChangedSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomFadeInDown(
                          duration: 400,
                          child: SvgPicture.asset(AppImages.imagesSuccess),
                        ),
                        verticalSpace(40),
                        CustomFadeInLeft(
                          duration: 500,
                          child: Text(
                            LocaleKeys.passwordChangedSuccessfully.tr(),
                            style: AppTextStyles.bold24,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpace(12),
                        CustomFadeInLeft(
                          duration: 600,
                          child: Text(
                            LocaleKeys.passwordChangedMessage.tr(),
                            style: AppTextStyles.med18.copyWith(
                              color: AppColors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpace(50),
                        CustomFadeInUp(
                          duration: 700,
                          child: AppTextButton(
                            onPressed: () {
                              context.pushNamedAndRemoveUntil(
                                Routes.loginRoute,
                                predicate: (route) => false,
                              );
                            },
                            text: LocaleKeys.backToLogin.tr(),
                          ),
                        ),
                      ],
                    ).withPadding(all: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
