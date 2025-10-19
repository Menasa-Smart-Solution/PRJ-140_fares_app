part of '../../../feature_imports.dart';

class ShipmentItemCard extends StatelessWidget {
  final Map<String, dynamic> shipmentData;
  final int index;

  const ShipmentItemCard({
    super.key,
    required this.shipmentData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final String id = shipmentData['id'] as String;
    final String title = shipmentData['title'] as String;
    final double amount = shipmentData['amount'] as double;
    final String phoneNumber = shipmentData['phoneNumber'] as String;

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.textFormBorderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  id,
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.pastelGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$amount ${LocaleKeys.currency.tr()}',
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Text(
            title,
            style: AppTextStyles.med16.copyWith(color: AppColors.black),
          ),
          verticalSpace(8),
          Row(
            children: [
              const Icon(Icons.phone_outlined, size: 16, color: AppColors.grey),
              horizontalSpace(6),
              Text(
                phoneNumber,
                style: AppTextStyles.reg14.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
