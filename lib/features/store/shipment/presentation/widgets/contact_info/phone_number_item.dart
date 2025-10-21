part of '../../../feature_imports.dart';

class PhoneNumberItem extends StatelessWidget {
  final String phoneNumber;

  const PhoneNumberItem({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightPrimaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              phoneNumber,
              style: AppTextStyles.bold16.copyWith(
                color: AppColors.primaryColor,
                letterSpacing: 1.2,
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
            ),
          ),
          horizontalSpace(12),
          InkWell(
            onTap: () {
              // Handle phone call
              // You can use url_launcher package: launch('tel:$phoneNumber')
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.phone, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
