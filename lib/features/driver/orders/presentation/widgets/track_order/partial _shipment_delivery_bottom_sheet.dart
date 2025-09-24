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
              '${LocaleKeys.partialDelivery.tr()}\n#147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            OrderPriceDetailsItem(
              title: LocaleKeys.productPrice.tr(),
              price: '200.0 د.ل',
              color: AppColors.grey,
            ),
            OrderPriceDetailsItem(
              title: LocaleKeys.shippingPrice.tr(),
              price: '5.00 د.ل',
              color: AppColors.grey,
            ),
            OrderPriceDetailsItem(
              title: LocaleKeys.total.tr(),
              price: '205.0 د.ل',
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: LocaleKeys.amountToReceive.tr(),
              validator: (value) {},
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: LocaleKeys.piecesDelivered.tr(),
              validator: (value) {},
            ),
            verticalSpace(24),
            BottomSheetActions(title: LocaleKeys.deliver.tr()),

            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
