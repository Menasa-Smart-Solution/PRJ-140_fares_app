part of '../widgets.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.textFormBorderColor),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppImages.imagesSearch),
            horizontalSpace(12),
            Expanded(
              child: Text(
                'بحث...',
                style: AppTextStyles.reg14.copyWith(color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
