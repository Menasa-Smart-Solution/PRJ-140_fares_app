part of '../widgets.dart';

class DashboardCardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final VoidCallback? onTap;

  const DashboardCardWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        elevation: 3,
        shadowColor: Colors.grey.withAlpha(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          splashColor: AppColors.pastelGreen,
          highlightColor: AppColors.pastelGreen,
          hoverColor: AppColors.pastelGreen,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: AppTextStyles.med14,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpace(2),
                Text(
                  subtitle ?? '',
                  style: AppTextStyles.med12.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(10),

                Skeleton.leaf(
                  child: SizedBox(
                    width: 89,
                    height: 65,
                    child: Image.asset(imagePath),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
