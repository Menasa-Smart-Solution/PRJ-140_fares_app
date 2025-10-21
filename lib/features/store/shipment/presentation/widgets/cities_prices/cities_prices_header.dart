part of '../../../feature_imports.dart';

class CitiesPricesHeader extends StatelessWidget {
  const CitiesPricesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.location_city_rounded,
                  color: AppColors.lightPrimaryColor,
                  size: 24,
                ),
              ),
              horizontalSpace(12),
              Text(
                'أسعار الشحن للمدن',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightPrimaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoItem(
                  icon: Icons.location_on,
                  label: 'إجمالي المدن',
                  value: '8',
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: AppColors.primaryColor.withOpacity(0.2),
                ),
                _buildInfoItem(
                  icon: Icons.check_circle,
                  label: 'المتاحة',
                  value: '7',
                  valueColor: AppColors.lightPrimaryColor,
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: AppColors.primaryColor.withOpacity(0.2),
                ),
                _buildInfoItem(
                  icon: Icons.cancel,
                  label: 'غير متاحة',
                  value: '1',
                  valueColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Column(
      children: [
        Icon(icon, color: valueColor ?? AppColors.primaryColor, size: 20),
        verticalSpace(4),
        Text(
          value,
          style: AppTextStyles.bold16.copyWith(
            color: valueColor ?? AppColors.primaryColor,
          ),
        ),
        Text(label, style: AppTextStyles.reg12.copyWith(color: AppColors.grey)),
      ],
    );
  }
}
