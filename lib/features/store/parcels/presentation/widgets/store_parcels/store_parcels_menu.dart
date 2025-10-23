part of '../../../feature_imports.dart';

class StoreParcelsMenu extends StatefulWidget {
  const StoreParcelsMenu({super.key, required this.storeParcelModel});
  final StoreParcelModel storeParcelModel;

  @override
  State<StoreParcelsMenu> createState() => _StoreParcelsMenuState();
}

class _StoreParcelsMenuState extends State<StoreParcelsMenu> {
  late final List<String> options;

  @override
  void initState() {
    super.initState();
    options = [
      LocaleKeys.contactCourier.tr(),
      LocaleKeys.chatWithCourier.tr(),
      LocaleKeys.copyShipmentLink.tr(),
    ];
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
}
