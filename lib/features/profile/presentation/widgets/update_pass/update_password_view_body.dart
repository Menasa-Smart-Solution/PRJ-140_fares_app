part of '../../../feature_imports.dart';

class UpdatePasswordViewBody extends StatefulWidget {
  const UpdatePasswordViewBody({super.key});

  @override
  State<UpdatePasswordViewBody> createState() => _UpdatePasswordViewBodyState();
}

class _UpdatePasswordViewBodyState extends State<UpdatePasswordViewBody> {
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
            child: Text(
              LocaleKeys.changePassword.tr(),
              style: AppTextStyles.bold24,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 500,
            child: Text(
              LocaleKeys.changePasswordInstruction.tr(),
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
            child: PasswordFormField(
              passwordController: _confirmPasswordController,
              title: 'كلمة المرور القديمة',
              hintText: LocaleKeys.passwordHint.tr(),
              validator: (value) {},
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),

        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 700,
            child: NewPasswordTextFromField(
              newPasswordController: _newPasswordController,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: CustomFadeInLeft(
            duration: 800,
            child: PasswordFormField(
              passwordController: _confirmPasswordController,
              title: LocaleKeys.confirmPasswordLabel.tr(),
              hintText: LocaleKeys.passwordHint.tr(),
              validator: (value) {},
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(70)),
        SliverToBoxAdapter(
          child: CustomFadeInUp(
            duration: 900,
            child: AppTextButton(
              onPressed: () {
                // Navigate to success screen
                context.pushReplacementNamed(
                  Routes.passwordChangedSuccessRoute,
                );
              },
              text: LocaleKeys.changeButton.tr(),
            ),
          ).withPadding(bottom: 50),
        ),
      ],
    );
  }
}
