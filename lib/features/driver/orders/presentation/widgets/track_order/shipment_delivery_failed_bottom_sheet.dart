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
              'تعذر التسليم للشحنه\n #147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: 'اختر الحاله',
              backgroundColor: AppColors.white,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              validator: (value) {},
            ),
            verticalSpace(8),
            AppTextFormField(
              hintText: 'ملاحظه اضافيه',
              backgroundColor: AppColors.white,
              validator: (value) {},
            ),
            verticalSpace(16),
            const BottomSheetActions(title: 'تحديث'),

            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
