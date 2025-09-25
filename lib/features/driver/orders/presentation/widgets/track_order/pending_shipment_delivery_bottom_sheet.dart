part of '../../../feature_imports.dart';

class PendingShipmentDeliveryBottomSheet extends StatelessWidget {
  const PendingShipmentDeliveryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetContainer(),
            verticalSpace(16),
            Text(
              '${LocaleKeys.inDelivery.tr()}\n #147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: LocaleKeys.reason.tr(),
              maxLines: 2,
              radius: 20,
              backgroundColor: AppColors.white,
              validator: (value) {},
            ),
            verticalSpace(16),
            BottomSheetActions(title: LocaleKeys.update.tr()),
            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
