part of '../../../feature_imports.dart';

class StoreParcelsItem extends StatelessWidget {
  const StoreParcelsItem({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        '125415',
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
                    translateStatus('pending'),
                    style: AppTextStyles.med12.copyWith(color: AppColors.white),
                  ),
                ),
                horizontalSpace(8),
                const StoreParcelsMenu(),
              ],
            ),
            _buildDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      OrderDetailsWidget(
                        title: LocaleKeys.description.tr(),
                        value: 'paasdasd',
                      ),
                      OrderDetailsWidget(
                        title: LocaleKeys.recipient.tr(),
                        value: 'paasdasd',
                      ),
                      OrderDetailsWidget(
                        title: LocaleKeys.creationDate.tr(),
                        value: formatToArabicDate('10-5-2024' ?? ''),
                      ),
                      const OrderDetailsWidget(
                        title: 'سعر المنتج',
                        value: '200 د.ل',
                      ),
                      const OrderDetailsWidget(
                        title: 'سعر الشحن',
                        value: '50 د.ل',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsWidget(
                        title: LocaleKeys.pieces.tr(),
                        value: 'paasdasd',
                      ),
                      const OrderDetailsWidget(
                        title: 'الملاحظات',
                        value: 'asdasdas',
                      ),

                      const OrderDetailsWidget(
                        title: 'مندوب التوصيل',
                        value: 'اسم المندوب',
                      ),
                      const OrderDetailsWidget(
                        title: 'رقم نقال المندوب',
                        value: '0123456789',
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
                  '99 د.ل',
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
