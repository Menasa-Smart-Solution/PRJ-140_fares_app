part of '../../../feature_imports.dart';

class PendingShipmentDeliveryBottomSheet extends StatefulWidget {
  const PendingShipmentDeliveryBottomSheet({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  State<PendingShipmentDeliveryBottomSheet> createState() =>
      _PendingShipmentDeliveryBottomSheetState();
}

class _PendingShipmentDeliveryBottomSheetState
    extends State<PendingShipmentDeliveryBottomSheet> {
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

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
              '${LocaleKeys.inDelivery.tr()}\n #${widget.parcel.id}',
              style: AppTextStyles.semiBold24,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: LocaleKeys.reason.tr(),
              controller: _reasonController,
              maxLines: 2,
              radius: 20,
              backgroundColor: AppColors.white,
              validator: (value) {},
            ),
            verticalSpace(16),
            BottomSheetActions(
              title: LocaleKeys.update.tr(),
              onPressed: () {
                context.pop();
                context.read<OrderOperationCubit>().updateOrderStatus(
                  ChangeOrderStatusRequest(
                    ids: [widget.parcel.id!],
                    status: "Delay",
                    notes: _reasonController.text,
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
