part of '../../../feature_imports.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final TextStyle? valueStyle;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.med14.copyWith(color: AppColors.grey),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Text(
            value.isEmpty ? '-' : value,
            style: (valueStyle ?? AppTextStyles.med14).copyWith(
              color: valueColor ?? AppColors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
