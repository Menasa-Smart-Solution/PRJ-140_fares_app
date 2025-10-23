part of '../../../feature_imports.dart';

class StoreParcelsItem extends StatelessWidget {
  const StoreParcelsItem({super.key, required this.storeParcelModel});
  final StoreParcelModel storeParcelModel;
  @override
  Widget build(BuildContext context) {
    final totalPrice =
        int.parse(storeParcelModel.productPrice ?? '0') +
        int.parse(storeParcelModel.shippingPrice ?? '0');
    return Skeleton.leaf(
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.storeParcelDetailsRoute);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightPrimaryColor,
                    child: SvgPicture.asset(AppImages.imagesSubtract),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.trackingNumber.tr(),
                          style: AppTextStyles.med12.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          storeParcelModel.id.toString(),
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
                      translateStatus(storeParcelModel.status ?? ''),
                      style: AppTextStyles.med12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  StoreParcelsMenu(storeParcelModel: storeParcelModel),
                ],
              ),
              _buildDivider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        OrderDetailsWidget(
                          title: LocaleKeys.description.tr(),
                          value: storeParcelModel.desc ?? '',
                        ),
                        OrderDetailsWidget(
                          title: LocaleKeys.recipient.tr(),
                          value: storeParcelModel.recipientNumber ?? '',
                        ),
                        OrderDetailsWidget(
                          title: LocaleKeys.creationDate.tr(),
                          value: formatToArabicDate(
                            storeParcelModel.createdAt ?? '',
                          ),
                        ),
                        OrderDetailsWidget(
                          title: 'سعر المنتج',
                          value: '${storeParcelModel.productPrice} د.ل',
                        ),
                        OrderDetailsWidget(
                          title: 'سعر الشحن',
                          value: '${storeParcelModel.shippingPrice} د.ل',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderDetailsWidget(
                          title: LocaleKeys.pieces.tr(),
                          value: '${storeParcelModel.qty}',
                        ),
                        OrderDetailsWidget(
                          title: 'الملاحظات',
                          value: storeParcelModel.notes ?? '-',
                        ),

                        OrderDetailsWidget(
                          title: 'مندوب التوصيل',
                          value: storeParcelModel.deliveryman?.name ?? '-',
                        ),
                        OrderDetailsWidget(
                          title: 'رقم نقال المندوب',
                          value: storeParcelModel.deliveryman?.phone ?? '-',
                        ),
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
                    LocaleKeys.total.tr(),
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    '$totalPrice د.ل',
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() =>
      const Divider(color: AppColors.lightPrimaryColor, thickness: 1);
}
