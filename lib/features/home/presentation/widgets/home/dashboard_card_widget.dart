part of '../widgets.dart';

class DashboardCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback? onTap;

  const DashboardCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 2,
      shadowColor: Colors.grey.withAlpha(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        // splashColor: iconColor.withOpacity(0.2),
        // highlightColor: iconColor.withOpacity(0.1),
        // hoverColor: iconColor.withOpacity(0.05),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                title,
                style: AppTextStyles.med14,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(2),
              Text(
                subtitle,
                style: AppTextStyles.med12.copyWith(color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
              verticalSpace(10),

              SizedBox(
                width: 89,
                height: 65,
                child: SvgPicture.asset(AppImages.imagesDelivery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
