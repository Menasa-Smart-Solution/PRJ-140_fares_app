part of '../../feature_imports.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Container(
                width: 124,
                height: 124,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey200,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},

                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SvgPicture.asset(AppImages.imagesEdit),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).center,
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(
          child: Text("Stephen McConan", style: AppTextStyles.med14).center,
        ),
        SliverToBoxAdapter(child: verticalSpace(50)),
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: "Stephen McConan",
            title: "الاسم الكامل",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: "+62 812 3456 7890",
            title: "رقم الجوال",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: "steven@mail.com",
            title: "البريد الالكتروني",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: "*******************",
            title: "كلمة المرور",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            suffixIcon: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),

                onTap: () {
                  context.pushNamed(Routes.updatePasswordRoute);
                },
                child: Text(
                  "تغيير",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.med14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ).withPadding(top: 12),
              ),
            ),
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: "ذكر",
            title: "الجنس",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            suffixIcon: const Icon(Icons.keyboard_arrow_down),
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AppTextButton(
              onPressed: () {},
              text: LocaleKeys.update.tr(),
            ),
          ).withPadding(bottom: 20),
        ),
      ],
    );
  }
}
