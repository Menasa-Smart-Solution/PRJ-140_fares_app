part of '../../../feature_imports.dart';

class AllOrdersViewBody extends StatelessWidget {
  const AllOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: LocaleKeys.searchHint.tr(),
          borderColor: AppColors.textFormBorderColor,
          backgroundColor: AppColors.white,
          validator: (value) {},
          prefixIcon: Image.asset(
            AppImages.imagesSearchPng,
            width: 20,
            height: 20,
          ).withPadding(all: 12),
        ),
        verticalSpace(16),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  highlightColor: AppColors.lightPrimaryColor,
                  hoverColor: AppColors.lightPrimaryColor,

                  onTap: () {
                    context.pushNamed(Routes.trackOrderRoute);
                  },
                  child: const OrderCardItem().withPadding(bottom: 8),
                ),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
