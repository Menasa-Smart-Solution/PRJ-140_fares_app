part of '../../../feature_imports.dart';

class StoreParcelsMenu extends StatefulWidget {
  const StoreParcelsMenu({super.key, required this.storeParcelModel});
  final StoreParcelModel storeParcelModel;

  @override
  State<StoreParcelsMenu> createState() => _StoreParcelsMenuState();
}

class _StoreParcelsMenuState extends State<StoreParcelsMenu> {
  final List<String> options = [
    LocaleKeys.contactCourier.tr(),
    LocaleKeys.chatWithCourier.tr(),
    LocaleKeys.copyShipmentLink.tr(),
    // LocaleKeys.editShipment.tr(),
    // LocaleKeys.deleteShipment.tr(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.storeParcelModel.status == 'UnderPreparation') {
      options.addAll([
        LocaleKeys.editShipment.tr(),
        LocaleKeys.deleteShipment.tr(),
      ]);
    }
  }

  void copyShipmentLink() async {
    final shipmentLink = widget.storeParcelModel.shareTrackingCodeLink ?? '';
    await Clipboard.setData(ClipboardData(text: shipmentLink));
    showSnackBar(
      message: LocaleKeys.copyShipmentLinkSuccess.tr(),
      type: SnackType.success,
    );
  }

  void contactDeliveryman() async {
    if (widget.storeParcelModel.deliveryman?.phone == null) {
      showSnackBar(message: 'رقم المندوب غير متوفر', type: SnackType.error);
      return;
    }
    await makePhoneCall(widget.storeParcelModel.deliveryman?.phone ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.primaryColor.withAlpha(15),
        ),
      ),

      icon: const Icon(Icons.more_horiz, color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return options
            .map(
              (option) => PopupMenuItem(
                value: option,
                child: Text(option, style: AppTextStyles.semiBold14),
              ),
            )
            .toList();
      },
      onSelected: (value) async {
        switch (value) {
          case String copy when copy == LocaleKeys.copyShipmentLink.tr():
            copyShipmentLink();
            break;
          case String contactDelivery
              when contactDelivery == LocaleKeys.contactCourier.tr():
            contactDeliveryman();
            break;
          case String editShipment
              when editShipment == LocaleKeys.editShipment.tr():
            context.pushNamed(
              Routes.updateParcelRoute,
              arguments: widget.storeParcelModel.id,
            );
            break;
          case String deleteShipment
              when deleteShipment == LocaleKeys.deleteShipment.tr():
            _showDeleteDialog();
            break;

          case String storeChatKey
              when storeChatKey == LocaleKeys.chatWithCourier.tr():
            await openStoreChat();
            break;
        }
      },
    );
  }

  Future<void> openStoreChat() async {
    context.pushNamed(
      Routes.chatRoute,
      arguments: ChatParam(parcelId: widget.storeParcelModel.id),
    );
  }

  void _showDeleteDialog() {
    final cubit = context.read<StoreParcelsCubit>();
    showDialog(
      context: context,
      builder: (context) {
        return Builder(
          builder: (context) {
            return BlocProvider.value(
              value: cubit,
              child: DeleteParcelAlertDialog(
                onTap: () {
                  cubit.deleteParcel(id: widget.storeParcelModel.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}
