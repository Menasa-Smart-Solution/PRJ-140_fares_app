part of '../../../feature_imports.dart';

class OrderQrCodeViewBody extends StatefulWidget {
  const OrderQrCodeViewBody({super.key, required this.isConfirmOrder});
  final bool isConfirmOrder;

  @override
  State<OrderQrCodeViewBody> createState() => _OrderQrCodeViewBodyState();
}

class _OrderQrCodeViewBodyState extends State<OrderQrCodeViewBody> {
  final TextEditingController _qrCodeController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  Future<void> _startScan() async {
    try {
      String? res = await SimpleBarcodeScanner.scanBarcode(
        context,
        barcodeAppBar: const BarcodeAppBar(
          enableBackButton: true,
          backButtonIcon: Icon(Icons.arrow_back_ios),
        ),
        isShowFlashIcon: true,
        delayMillis: 2000,
        cameraFace: CameraFace.back,
      );
      setState(() {
        _qrCodeController.text = res ?? '';
      });
    } on PlatformException {
      showSnackBar(message: "❌ حدث خطأ أثناء المسح", type: SnackType.error);
    }
  }

  @override
  dispose() {
    _qrCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppTextFormField(
              hintText: 'QR Code',
              controller: _qrCodeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.fieldRequired.tr();
                }
                return null;
              },
              backgroundColor: Colors.transparent,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextButton(
                  onPressed: () async {
                    if (fromKey.currentState!.validate()) {
                      await context
                          .read<OrderOperationCubit>()
                          .updateOrderStatus(
                            ChangeOrderStatusRequest(
                              ids: [int.parse(_qrCodeController.text)],
                              status: widget.isConfirmOrder
                                  ? "FinancialSettlementPending"
                                  : "RewindInProgress",
                            ),
                          );
                    }
                  },
                  text: LocaleKeys.confirm.tr(),
                ),
                verticalSpace(24),
                AppTextButton(
                  onPressed: () async {
                    await _startScan();
                  },
                  backgroundColor: AppColors.primaryColor.withAlpha(50),
                  textColor: AppColors.primaryColor,
                  text: LocaleKeys.scanQRCode.tr(),
                ),
                verticalSpace(32),
                const ChangeStatusBlocListener(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
