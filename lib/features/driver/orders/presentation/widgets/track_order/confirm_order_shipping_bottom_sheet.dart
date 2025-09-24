part of '../../../feature_imports.dart';

class ConfirmOrderShippingBottomSheet extends StatelessWidget {
  const ConfirmOrderShippingBottomSheet({super.key});

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
            SvgPicture.asset(AppImages.imagesSuccess),
            verticalSpace(16),
            Text(
              'تاكيد تسليم الشحنه \n#147077',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              "هل انت متاكد من تسليم الشحنه الي المستلم واستلام قيمه 125.0 د.ل",
              textAlign: TextAlign.center,
              style: AppTextStyles.med18.copyWith(color: AppColors.grey),
            ),
            verticalSpace(24),
            Row(
              children: [
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      // Handle confirm button press
                    },
                    text: 'نعم',
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  child: AppTextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'إلغاء',
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.red,
                    hoverColor: AppColors.red.withOpacity(0.1),
                  ),
                ),
              ],
            ),

            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
