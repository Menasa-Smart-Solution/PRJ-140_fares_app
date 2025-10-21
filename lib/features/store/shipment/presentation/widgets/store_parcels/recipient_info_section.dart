part of '../../../feature_imports.dart';

class RecipientInfoSection extends StatelessWidget {
  final Map<String, dynamic> recipientData;

  const RecipientInfoSection({super.key, required this.recipientData});

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
        children: [
          _buildSectionHeader(),
          verticalSpace(20),
          InfoRow(label: 'الاسم', value: recipientData['name'] as String),
          verticalSpace(12),
          InfoRow(
            label: 'الهاتف',
            value: recipientData['phone'] as String,
            valueColor: AppColors.primaryColor,
          ),
          verticalSpace(12),
          InfoRow(
            label: 'الهاتف الإحتياطي',
            value: recipientData['backupPhone'] as String,
          ),
          verticalSpace(12),
          InfoRow(label: 'المدينة', value: recipientData['city'] as String),
          verticalSpace(12),
          InfoRow(label: 'العنوان', value: recipientData['address'] as String),
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
            color: AppColors.lightPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.person_outline,
            color: AppColors.lightPrimaryColor,
            size: 24,
          ),
        ),
        horizontalSpace(12),
        Text(
          'بيانات المستلم',
          style: AppTextStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
