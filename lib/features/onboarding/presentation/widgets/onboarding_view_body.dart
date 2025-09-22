import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/core/utils/app_images.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  bool _imageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imagesOnboarding),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(100),
            BlendMode.darken,
          ),
          onError: (exception, stackTrace) {
            log('Image loading error: $exception');
          },
        ),
      ),
      child: FutureBuilder(
        future: _precacheImage(),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (snapshot.connectionState == ConnectionState.done)
                CustomFadeInLeft(
                  duration: 500,
                  child: Text(
                    LocaleKeys.trackingTitle.tr(),
                    style: AppTextStyles.font50W700.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              if (snapshot.connectionState == ConnectionState.done)
                verticalSpace(8),
              if (snapshot.connectionState == ConnectionState.done)
                CustomFadeInLeft(
                  duration: 700,
                  child: Text(
                    LocaleKeys.deliverySubtitle.tr(),
                    style: AppTextStyles.med18.copyWith(color: AppColors.white),
                  ),
                ),
              verticalSpace(100),
              if (snapshot.connectionState == ConnectionState.done)
                CustomFadeInUp(
                  duration: 900,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.pushReplacementNamed(Routes.welcomeRoute);
                      },
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        height: 64,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 20),
                            Text(
                              LocaleKeys.startNow.tr(),
                              style: AppTextStyles.bold16,
                            ),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ).withPadding(all: 8),
                      ),
                    ),
                  ),
                ),
              verticalSpace(60),
            ],
          ).withPadding(horizontal: 20);
        },
      ),
    );
  }

  Future<void> _precacheImage() async {
    if (!_imageLoaded) {
      await precacheImage(AssetImage(AppImages.imagesOnboarding), context);
      _imageLoaded = true;
    }
  }
}
