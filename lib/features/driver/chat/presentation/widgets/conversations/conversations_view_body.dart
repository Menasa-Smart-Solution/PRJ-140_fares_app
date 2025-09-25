part of '../../../feature_imports.dart';

class ConversationsViewBody extends StatelessWidget {
  const ConversationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AppTextFormField(
            hintText: LocaleKeys.searchHint.tr(),
            validator: (value) {},
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                AppImages.imagesSearchPng,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),

        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.imagesEmptyMessages),
              verticalSpace(20),
              Text(LocaleKeys.noMessages.tr(), style: AppTextStyles.semiBold24),
              Text(
                LocaleKeys.noMessagesSubtitle.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.med14.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
