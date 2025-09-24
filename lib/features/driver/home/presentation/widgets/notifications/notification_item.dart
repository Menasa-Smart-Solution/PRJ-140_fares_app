part of '../widgets.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.pastelGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              AppIcons.package,
              color: AppColors.complimentaryGreen,
              size: 20,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "لقد تم تسليم الطرد الخاص بك بنجاح",
                  style: AppTextStyles.med16,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Text(
                  "11:36 صباحًا",
                  style: AppTextStyles.reg14.copyWith(
                    color: AppColors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),

          horizontalSpace(12),

          Text(
            "اليوم",
            style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
