import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/features/auth/presentation/widgets/change_password/new_password_text_form_field.dart';
import 'package:fares/features/auth/presentation/widgets/password_form_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 400,
            child: Text("تغيير كلمة المرور", style: AppTextStyles.bold24),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 500,
            child: Text(
              "يجب أن تكون كلمة المرور الجديدة فريدة من بين تلك التي استخدمتها سابقًا.",
              style: AppTextStyles.reg16.copyWith(
                color: AppColors.inActiveButton,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(32)),
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 600,
            child: NewPasswordTextFromField(
              newPasswordController: _newPasswordController,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 700,
            child: PasswordFormField(
              passwordController: _confirmPasswordController,
              title: "تأكيد كلمة المرور",
              hintText: "ادخل كلمة المرور",
              validator: (value) {},
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomFadeInUp(
              duration: 800,
              child: AppTextButton(onPressed: () {}, text: "تغيير"),
            ).withPadding(bottom: 50),
          ),
        ),
      ],
    );
  }
}
