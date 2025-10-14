part of '../../../feature_imports.dart';

class ConfirmOrderShippingBottomSheet extends StatelessWidget {
  const ConfirmOrderShippingBottomSheet({super.key, required this.parcel});
  final ParcelModel parcel;

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
            SvgPicture.asset(AppImages.imagesSuccess),
            verticalSpace(16),
            Text(
              '${LocaleKeys.confirmDelivery.tr()} \n#${parcel.id}',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              tr(
                LocaleKeys.confirmDeliveryQuestion,
                namedArgs: {'price': '${parcel.productPrice} '},
              ),
              textAlign: TextAlign.center,
              style: AppTextStyles.med18.copyWith(color: AppColors.grey),
            ),
            verticalSpace(24),
            BottomSheetActions(
              title: LocaleKeys.yes.tr(),
              onPressed: () {
                context.pop();
                AppLogger.info(
                  'Updating order ${parcel.id} to status ${parcel.status}',
                );
                context.read<OrderOperationCubit>().updateOrderStatus(
                  ChangeOrderStatusRequest(
                    ids: [parcel.id!],
                    status: "FinancialSettlementPending",
                    notes: "توصيل لعند باب الحوش",
                  ),
                );
              },
            ),
            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
