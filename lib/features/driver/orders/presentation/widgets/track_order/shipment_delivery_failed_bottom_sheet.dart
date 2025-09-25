part of '../../../feature_imports.dart';

class ShipmentDeliveryFailedBottomSheet extends StatelessWidget {
  const ShipmentDeliveryFailedBottomSheet({super.key});

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
              '${LocaleKeys.theDeliveryFailed.tr()}\n #147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: LocaleKeys.selectStatus.tr(),
              backgroundColor: AppColors.white,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              validator: (value) {},
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: LocaleKeys.additionalNote.tr(),
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
