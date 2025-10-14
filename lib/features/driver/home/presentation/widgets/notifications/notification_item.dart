part of '../widgets.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationModel notification;
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
            child: const Icon(
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
                  notification.title ?? '',
                  style: AppTextStyles.med16,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Text(
                  notification.body ?? '',
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
            DateFormat(
              'hh:mm a',
              'en',
            ).format(DateTime.parse(notification.createdAt ?? '')),
            style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
