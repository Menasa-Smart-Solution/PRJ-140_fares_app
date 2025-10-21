part of '../../../feature_imports.dart';

class ShipmentCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const ShipmentCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final String id = data['id'] as String;
    final String title = data['title'] as String;
    final double amount = data['amount'] as double;
    final String phone = data['phone'] as String;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightPrimaryColor.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // المبلغ (يسار في العرض RTL)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.lightPrimaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${amount.toStringAsFixed(1)} د.ل',
              style: AppTextStyles.med16.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // تفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  id,
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: AppTextStyles.reg14.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Text(
                  phone,
                  style: AppTextStyles.reg12.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
