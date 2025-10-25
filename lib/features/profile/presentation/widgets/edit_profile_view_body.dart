part of '../../feature_imports.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Skeleton.leaf(
            child: Container(
              width: 124,
              height: 124,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImages.imagesMan),
                  fit: BoxFit.cover,
                ),
              ),
            ).center,
          ),
          verticalSpace(20),
          Text(userModel.ownerName ?? '', style: AppTextStyles.med14).center,
          verticalSpace(50),
          AppTextFormField(
            hintText: userModel.id.toString(),
            title: "رقم المتجر",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
          verticalSpace(16),

          AppTextFormField(
            hintText: userModel.name,
            title: "اسم المتجر",
            showLabel: true,
            validator: (value) {},
            showFocusedBorder: false,
            readOnly: true,
            radius: 5,
            borderColor: AppColors.textFormFieldBg,
            titleColor: AppColors.inActiveButton,
          ),
          verticalSpace(16),
          userModel.phone != null
              ? AppTextFormField(
                  hintText: userModel.phone!,
                  title: LocaleKeys.phone.tr(),
                  showLabel: true,
                  validator: (value) {},
                  showFocusedBorder: false,
                  readOnly: true,
                  radius: 5,
                  borderColor: AppColors.textFormFieldBg,
                  titleColor: AppColors.inActiveButton,
                )
              : const SizedBox(),
          verticalSpace(16),
          verticalSpace(16),
          userModel.phone2 != null
              ? AppTextFormField(
                  hintText: userModel.phone2!,
                  title: LocaleKeys.phone2.tr(),
                  showLabel: true,
                  validator: (value) {},
                  showFocusedBorder: false,
                  readOnly: true,
                  radius: 5,
                  borderColor: AppColors.textFormFieldBg,
                  titleColor: AppColors.inActiveButton,
                )
              : const SizedBox(),
          verticalSpace(32),
          const DeleteAccountBlocListener(),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppTextButton(
              backgroundColor: Colors.red,
              onPressed: () {
                final cubit = context.read<ProfileCubit>();
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: const DeleteAccountDialog(),
                  ),
                );
              },
              text: LocaleKeys.deleteAccount.tr(),
            ),
          ).withPadding(bottom: 20),
        ],
      ),
    );
  }
}
