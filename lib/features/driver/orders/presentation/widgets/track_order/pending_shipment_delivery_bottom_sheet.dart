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
              'قيد التسليم للشحنه\n #147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: 'السبب',
              maxLines: 2,
              radius: 20,
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
