part of '../../../feature_imports.dart';

class PhoneNumbersSection extends StatelessWidget {
  final List<String> phoneNumbers;

  const PhoneNumbersSection({super.key, required this.phoneNumbers});

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
                  color: AppColors.lightPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.phone_enabled,
                  color: AppColors.lightPrimaryColor,
                  size: 22,
                ),
              ),
              horizontalSpace(12),
              Text(
                'أرقام الهاتف',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          ...List.generate(phoneNumbers.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < phoneNumbers.length - 1 ? 12 : 0,
              ),
              child: PhoneNumberItem(phoneNumber: phoneNumbers[index]),
            );
          }),
        ],
      ),
    );
  }
}
