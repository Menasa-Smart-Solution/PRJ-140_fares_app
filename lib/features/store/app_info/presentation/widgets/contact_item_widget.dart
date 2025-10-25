part of '../../feature_imports.dart';

class ContactItemWidget extends StatelessWidget {
  final String name;
  final String? phone;
  final String? phone2;
  final String address;

  const ContactItemWidget({
    super.key,
    required this.name,
    required this.phone,
    this.phone2,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_city_rounded,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                horizontalSpace(8),
                Text(
                  name,
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),

          // Primary Phone
          if (phone != null && phone!.isNotEmpty) ...[
            verticalSpace(12),
            _buildInfoRow(
              icon: Icons.phone_rounded,
              label: 'الهاتف الأساسي',
              value: phone!,
              onTap: () => makePhoneCall(phone!),
            ),
          ],

          // Secondary Phone (if available)
          if (phone2 != null && phone2!.isNotEmpty) ...[
            verticalSpace(12),
            _buildInfoRow(
              icon: Icons.phone_outlined,
              label: 'هاتف بديل',
              value: phone2!,
              onTap: () => makePhoneCall(phone2!),
            ),
          ],

          verticalSpace(12),

          // Address
          _buildInfoRow(
            icon: Icons.location_on_rounded,
            label: 'العنوان',
            value: address,
            onTap: null,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: onTap != null
                    ? AppColors.lightPrimaryColor.withOpacity(0.1)
                    : AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: onTap != null
                    ? AppColors.lightPrimaryColor
                    : AppColors.primaryColor,
                size: 20,
              ),
            ),
            horizontalSpace(8),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.reg12.copyWith(
                      color: const Color(0xFF757575),
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    value,
                    style: AppTextStyles.med14.copyWith(
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            horizontalSpace(12),
            if (onTap != null) ...[
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.lightPrimaryColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
