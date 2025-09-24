part of '../../feature_imports.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightPrimaryColor,
                child: Icon(AppIcons.package),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رقم الرحله',
                      style: AppTextStyles.med12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'F - Y29RKS9I',
                      style: AppTextStyles.med24.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(50),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'قيد المراجعه',
                  style: AppTextStyles.med12.copyWith(color: AppColors.white),
                ),
              ),

              // Package Icon
            ],
          ),
          _buildDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderDetailsWidget(title: 'من:', value: 'طرابلس، ليبيا'),
                    verticalSpace(16),
                    OrderDetailsWidget(title: 'الوصف:', value: 'ملبس نسائي'),
                    verticalSpace(16),
                    OrderDetailsWidget(
                      title: 'تاريخ الإنشاء:',
                      value: '25 يوليو 2025',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderDetailsWidget(title: 'إلى:', value: 'بنغازي، ليبيا'),
                    verticalSpace(16),
                    OrderDetailsWidget(
                      title: 'المستلم:',
                      value: 'Albert Stevano',
                    ),
                    verticalSpace(16),
                    OrderDetailsWidget(title: 'عدد القطع:', value: '3'),
                  ],
                ),
              ),
            ],
          ),
          _buildDivider(),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الإجمالي',
                style: AppTextStyles.bold16.copyWith(color: AppColors.white),
              ),
              Text(
                '205.0 د.ل',
                style: AppTextStyles.bold16.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() =>
      Divider(color: AppColors.lightPrimaryColor, thickness: 1);
}
