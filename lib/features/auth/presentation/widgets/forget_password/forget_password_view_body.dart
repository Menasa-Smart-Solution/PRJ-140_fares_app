import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 400,
            child: Text(
              LocaleKeys.forgotPassword.tr(),
              style: AppTextStyles.bold24,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 500,
            child: Text(
              LocaleKeys.forgotPasswordInstruction.tr(),
              style: AppTextStyles.reg16,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(32)),
        SliverToBoxAdapter(
          child: CustomFadeInUp(
            duration: 600,
            child: AppTextFormField(
              hintText: LocaleKeys.emailPhoneHint.tr(),
              validator: (value) {},
              title: LocaleKeys.emailPhoneLabel.tr(),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: CustomFadeInUp(
            duration: 700,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.verificationCodeRoute);
                },
                text: LocaleKeys.continueButton.tr(),
              ),
            ).withPadding(bottom: 50),
          ),
        ),
      ],
    );
  }
}
