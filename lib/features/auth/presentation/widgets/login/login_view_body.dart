import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/app_text_from_field.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/core/utils/app_images.dart';
import 'package:fares/features/auth/presentation/widgets/have_or_dont_have_account.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(50),
              LoginWelcome(),
              verticalSpace(32),
              CustomFadeInLeft(
                duration: 600,
                child: AppTextFormField(
                  hintText: 'ادخل البريد او رقم الجوال',
                  validator: (value) {},
                  title: 'البريد الالكتروني او رقم الجوال',
                ),
              ),
              verticalSpace(16),
              CustomFadeInLeft(
                duration: 700,
                child: PasswordFormField(
                  passwordController: _passwordController,
                  title: "كلمة المرور",
                  hintText: "ادخل كلمة المرور",
                  validator: (value) {},
                ),
              ),
              CustomFadeInLeft(
                duration: 800,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles.med12.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomFadeInUp(
                  duration: 900,
                  child: AppTextButton(
                    onPressed: () {},
                    text: LocaleKeys.login.tr(),
                  ),
                ),
                verticalSpace(16),
                CustomFadeInUp(
                  duration: 1000,
                  child: HaveOrDontHaveAccount(
                    text1: "ليس لديك حساب؟",
                    text2: "انشاء حساب",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginWelcome extends StatelessWidget {
  const LoginWelcome({super.key});

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
              Text('مرحبا بك 👋', style: AppTextStyles.bold24),
              Text(
                'مرحباً بك مرة أخرى، لقد افتقدناك!',
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
