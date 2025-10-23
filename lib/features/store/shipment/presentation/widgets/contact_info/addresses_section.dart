part of '../../../feature_imports.dart';

class AddressesSection extends StatelessWidget {
  final List<Map<String, dynamic>> addresses;

  const AddressesSection({super.key, required this.addresses});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.location_city,
                  color: AppColors.primaryColor,
                  size: 22,
                ),
              ),
              horizontalSpace(12),
              Text(
                'العناوين',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          ...List.generate(addresses.length, (index) {
            final address = addresses[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < addresses.length - 1 ? 16 : 0,
              ),
              child: AddressItem(
                address: address['address'] as String,
                icon: address['icon'] as IconData,
              ),
            );
          }),
        ],
      ),
    );
  }
}
