part of '../../../feature_imports.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String date;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.title,
    required this.date,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.lightPrimaryColor,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: AppColors.lightPrimaryColor.withOpacity(0.3),
              ),
          ],
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightPrimaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.med14.copyWith(color: AppColors.black),
                ),
                verticalSpace(6),
                Text(
                  date,
                  style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
