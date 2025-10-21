part of '../../../feature_imports.dart';

class CityPriceCard extends StatelessWidget {
  final Map<String, dynamic> cityData;
  final int index;

  const CityPriceCard({super.key, required this.cityData, required this.index});

  @override
  Widget build(BuildContext context) {
    final String city = cityData['city'] as String;
    final double price = cityData['price'] as double;
    final bool isActive = cityData['isActive'] as bool;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive
              ? AppColors.lightPrimaryColor.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isActive
                ? AppColors.primaryColor.withOpacity(0.05)
                : Colors.grey.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.textFormBorderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.location_on,
              color: AppColors.primaryColor,
              size: 20,
            ),
          ),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المدينة',
                style: AppTextStyles.med14.copyWith(color: AppColors.grey),
              ),
              verticalSpace(4),
              Text(city, style: AppTextStyles.bold16),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'سعر التوصيل',
                style: AppTextStyles.med14.copyWith(color: AppColors.grey),
              ),
              verticalSpace(4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.pastelGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$price د.ل',
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
