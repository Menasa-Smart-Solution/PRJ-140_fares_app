part of '../../../feature_imports.dart';

class AddressItem extends StatelessWidget {
  final String address;
  final IconData icon;

  const AddressItem({super.key, required this.address, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 22),
          horizontalSpace(12),
          Expanded(
            child: Text(
              address,
              style: AppTextStyles.med16.copyWith(
                color: AppColors.black,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
