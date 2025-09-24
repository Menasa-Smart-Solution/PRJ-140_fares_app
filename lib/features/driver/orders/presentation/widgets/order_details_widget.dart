part of '../../feature_imports.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.med12.copyWith(color: AppColors.grey500),
        ),
        verticalSpace(4),
        Text(
          value,
          style: AppTextStyles.med14.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
