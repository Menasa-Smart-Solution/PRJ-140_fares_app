part of '../../../feature_imports.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.textFormFieldBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Skeleton.leaf(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.pastelGreen,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'الكمية :',
                    style: AppTextStyles.med14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    product.qty,
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          horizontalSpace(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.med16.copyWith(
                    color: Colors.black,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.right,
                ),
                verticalSpace(8),
                Text(
                  'السعر : ${product.price} د.ل',
                  style: AppTextStyles.reg14.copyWith(
                    color: const Color(0xFF9E9E9E),
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
