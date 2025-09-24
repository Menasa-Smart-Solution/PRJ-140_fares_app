part of '../../../feature_imports.dart';

class PartialShipmentDeliveryBottomSheet extends StatelessWidget {
  const PartialShipmentDeliveryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            verticalSpace(16),
            Text(
              'تسليم جزئي للشحنه\n#147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            const OrderPriceDetailsItem(
              title: 'سعر المنتج',
              price: '200.0 د.ل',
              color: AppColors.grey,
            ),
            const OrderPriceDetailsItem(
              title: 'سعر الشحن',
              price: '5.00 د.ل',
              color: AppColors.grey,
            ),
            OrderPriceDetailsItem(
              title: LocaleKeys.total.tr(),
              price: '205.0 د.ل',
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: 'المبلغ المراد استلامه مع حساب سعر التوصيل',
              validator: (value) {},
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'عدد القطع المستلمه من اصل 1',
              validator: (value) {},
            ),
            verticalSpace(24),
            const BottomSheetActions(title: 'تسليم'),

            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
