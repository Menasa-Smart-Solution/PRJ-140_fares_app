part of '../../../feature_imports.dart';

class OrderPriceDetailsItem extends StatelessWidget {
  const OrderPriceDetailsItem({
    super.key,
    required this.title,
    required this.price,
    this.color,
  });
  final String title;
  final String price;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.semiBold16.copyWith(color: color)),
        Text(price, style: AppTextStyles.semiBold16.copyWith(color: color)),
      ],
    );
  }
}
