part of '../../../feature_imports.dart';

class ValueColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final bool isDiscount;

  const ValueColumn({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
    this.isDiscount = false,
  });

  @override
  Widget build(BuildContext context) {
    final txtColor = isDiscount ? Colors.red : valueColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.reg12.copyWith(color: AppColors.darkGrey),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$value د.ل',
              style: AppTextStyles.med16.copyWith(color: txtColor),
            ),
          ],
        ),
      ],
    );
  }
}
