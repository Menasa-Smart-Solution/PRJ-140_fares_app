part of '../../../feature_imports.dart';

class ParcelInfoSection extends StatelessWidget {
  final StoreParcelModel storeParcel;

  const ParcelInfoSection({super.key, required this.storeParcel});

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        int.parse(storeParcel.productPrice ?? '0') +
        int.parse(storeParcel.shippingPrice ?? '0');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.lightPrimaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          _buildSectionHeader(),
          verticalSpace(20),
          InfoRow(label: 'الكود', value: storeParcel.id.toString()),
          verticalSpace(12),
          InfoRow(label: 'الوصف', value: storeParcel.desc ?? ''),
          verticalSpace(12),
          InfoRow(
            label: 'الحالة',
            value: storeParcel.status ?? '',
            valueColor: AppColors.lightPrimaryColor,
          ),
          verticalSpace(12),
          InfoRow(label: 'عدد القطع', value: storeParcel.qty.toString()),
          verticalSpace(16),
          Divider(color: AppColors.primaryColor.withOpacity(0.2)),
          verticalSpace(16),
          InfoRow(
            label: 'سعر المنتج',
            value: '${storeParcel.productPrice} د.ل',
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(12),
          InfoRow(
            label: 'سعر الشحن',
            value: '${storeParcel.shippingPrice} د.ل',
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(16),
          Divider(color: AppColors.primaryColor.withOpacity(0.2)),
          verticalSpace(16),
          InfoRow(
            label: 'الإجمالي',
            value: '$totalPrice د.ل',
            valueStyle: AppTextStyles.bold16,
            valueColor: AppColors.primaryColor,
          ),
          verticalSpace(12),
          InfoRow(
            label: 'الإنشاء',
            value: formatToArabicDate(storeParcel.createdAt ?? ''),
          ),
          verticalSpace(12),
          InfoRow(label: 'ملاحظة', value: storeParcel.notes ?? ''),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.inventory_2_outlined,
            color: AppColors.primaryColor,
            size: 24,
          ),
        ),
        horizontalSpace(12),
        Text(
          'بيانات الشحنة',
          style: AppTextStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
