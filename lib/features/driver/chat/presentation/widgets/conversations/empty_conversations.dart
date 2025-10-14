part of '../../../feature_imports.dart';

class EmptyConversations extends StatelessWidget {
  const EmptyConversations({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
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
    );
  }
}
