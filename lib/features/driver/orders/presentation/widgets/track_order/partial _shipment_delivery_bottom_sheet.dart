part of '../../../feature_imports.dart';

class PartialShipmentDeliveryBottomSheet extends StatefulWidget {
  const PartialShipmentDeliveryBottomSheet({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  State<PartialShipmentDeliveryBottomSheet> createState() =>
      _PartialShipmentDeliveryBottomSheetState();
}

class _PartialShipmentDeliveryBottomSheetState
    extends State<PartialShipmentDeliveryBottomSheet> {
  final TextEditingController _amountToReceiveController =
      TextEditingController();
  final TextEditingController _piecesDeliveredController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _amountToReceiveController.dispose();
    _piecesDeliveredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        (int.parse(widget.parcel.productPrice ?? '0') +
        int.parse(widget.parcel.shippingPrice ?? '0'));
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
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
                price: '${widget.parcel.productPrice} د.ل',
                color: AppColors.grey,
              ),
              OrderPriceDetailsItem(
                title: LocaleKeys.shippingPrice.tr(),
                price: '${widget.parcel.shippingPrice} د.ل',
                color: AppColors.grey,
              ),
              OrderPriceDetailsItem(
                title: LocaleKeys.total.tr(),
                price: '$totalPrice د.ل',
              ),
              verticalSpace(24),
              AppTextFormField(
                controller: _amountToReceiveController,
                hintText: LocaleKeys.amountToReceive.tr(),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  if (int.parse(value) > totalPrice) {
                    return 'يجب ان يكون المبلغ أقل من الاجمالي';
                  }
                  return null;
                },
              ),
              verticalSpace(8),
              AppTextFormField(
                hintText: LocaleKeys.piecesDelivered.tr(),
                controller: _piecesDeliveredController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.fieldRequired.tr();
                  }
                  final intValue = int.tryParse(value);
                  final maxQty = int.tryParse(widget.parcel.qty ?? '0') ?? 0;
                  AppLogger.info('Max qty: $maxQty  , entered: $intValue');
                  if (intValue == null) {
                    return 'يجب إدخال رقم صحيح';
                  }

                  if (intValue < 1) {
                    return 'الحد الأدنى لعدد القطع هو 1';
                  }

                  if (intValue > maxQty) {
                    return 'يجب أن يكون عدد القطع أقل من أو يساوي $maxQty';
                  }

                  return null;
                },
              ),
              verticalSpace(24),
              BottomSheetActions(
                title: LocaleKeys.deliver.tr(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pop();

                    context.read<OrderOperationCubit>().partialOrderStatus(
                      PartialDeliveryRequest(
                        parcelId: widget.parcel.id ?? 0,
                        quantity: int.parse(_piecesDeliveredController.text),
                        receivedMoney: int.parse(
                          _amountToReceiveController.text,
                        ),
                      ),
                    );
                  }
                },
              ),

              verticalSpace(20),
            ],
          ).withPadding(vertical: 20, horizontal: 16),
        ),
      ),
    );
  }
}
