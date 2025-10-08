part of '../../feature_imports.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({super.key, required this.parcel});
  final ParcelModel parcel;
  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkPrimaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightPrimaryColor,
                  child: SvgPicture.asset(AppImages.imagesSubtract),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.trackingNumber.tr(),
                        style: AppTextStyles.med12.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        parcel.id.toString(),
                        style: AppTextStyles.med24.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    translateStatus(parcel.status ?? ''),
                    style: AppTextStyles.med12.copyWith(color: AppColors.white),
                  ),
                ),

                // Package Icon
              ],
            ),
            _buildDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsWidget(
                        title: LocaleKeys.from.tr(),
                        value: 'طرابلس، ليبيا',
                      ),
                      verticalSpace(16),
                      OrderDetailsWidget(
                        title: LocaleKeys.description.tr(),
                        value: parcel.desc ?? '',
                      ),
                      verticalSpace(16),
                      OrderDetailsWidget(
                        title: LocaleKeys.creationDate.tr(),
                        value: formatToArabicDate(parcel.createdAt ?? ''),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsWidget(
                        title: LocaleKeys.to.tr(),
                        value: parcel.tocity?.name ?? '',
                      ),
                      verticalSpace(16),
                      OrderDetailsWidget(
                        title: LocaleKeys.recipient.tr(),
                        value: parcel.recipientNumber ?? '',
                      ),
                      verticalSpace(16),
                      OrderDetailsWidget(
                        title: LocaleKeys.pieces.tr(),
                        value: parcel.qty.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildDivider(),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.total.tr(),
                  style: AppTextStyles.bold16.copyWith(color: AppColors.white),
                ),
                Text(
                  '205.0 د.ل',
                  style: AppTextStyles.bold16.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() =>
      const Divider(color: AppColors.lightPrimaryColor, thickness: 1);
}
