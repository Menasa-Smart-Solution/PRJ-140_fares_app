part of '../../../feature_imports.dart';

class ParcelInfoSection extends StatelessWidget {
  final Map<String, dynamic> parcelData;

  const ParcelInfoSection({super.key, required this.parcelData});

  @override
  Widget build(BuildContext context) {
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
          InfoRow(label: 'الكود', value: parcelData['code'] as String),
          verticalSpace(12),
          InfoRow(label: 'الوصف', value: parcelData['description'] as String),
          verticalSpace(12),
          InfoRow(
            label: 'الحالة',
            value: parcelData['status'] as String,
            valueColor: AppColors.lightPrimaryColor,
          ),
          verticalSpace(12),
          InfoRow(label: 'عدد القطع', value: parcelData['pieces'] as String),
          verticalSpace(16),
          Divider(color: AppColors.primaryColor.withOpacity(0.2)),
          verticalSpace(16),
          InfoRow(
            label: 'سعر المنتج',
            value: '${parcelData['productPrice']} د.ل',
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(12),
          InfoRow(
            label: 'سعر الشحن',
            value: '${parcelData['shippingPrice']} د.ل',
            valueStyle: AppTextStyles.bold16,
          ),
          verticalSpace(16),
          Divider(color: AppColors.primaryColor.withOpacity(0.2)),
          verticalSpace(16),
          InfoRow(
            label: 'الإجمالي',
            value: '${parcelData['total']} د.ل',
            valueStyle: AppTextStyles.bold16,
            valueColor: AppColors.primaryColor,
          ),
          verticalSpace(12),
          InfoRow(label: 'الإنشاء', value: parcelData['createdAt'] as String),
          verticalSpace(12),
          InfoRow(label: 'ملاحظة', value: parcelData['notes'] as String),
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
