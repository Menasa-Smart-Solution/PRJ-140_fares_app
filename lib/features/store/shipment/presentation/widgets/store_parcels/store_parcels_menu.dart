part of '../../../feature_imports.dart';

class StoreParcelsMenu extends StatefulWidget {
  const StoreParcelsMenu({super.key});

  @override
  State<StoreParcelsMenu> createState() => _StoreParcelsMenuState();
}

class _StoreParcelsMenuState extends State<StoreParcelsMenu> {
  late final List<String> options;

  @override
  void initState() {
    super.initState();
    options = [LocaleKeys.contactCourier.tr(), LocaleKeys.chatWithCourier.tr()];
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
        // switch (value) {
        //   case String contactMerchantKey
        //       when contactMerchantKey == LocaleKeys.contactMerchant.tr():
        //     await makePhoneCall(widget.parcel.recipientNumber ?? '');
        //     break;
        //   case String whatsappKey when whatsappKey == LocaleKeys.whatsapp.tr():
        //     await openWhatsApp(widget.parcel.recipientNumber ?? '');
        //     break;
        //   case String storeChatKey
        //       when storeChatKey == LocaleKeys.storeChat.tr():
        //     await openStoreChat();
        //     break;

        //   case String addCallLogKey
        //       when addCallLogKey == LocaleKeys.addCallLog.tr():
        //     context.pushNamed(
        //       Routes.callLogsRoute,
        //       arguments: widget.parcel.id,
        //     );
        //     break;
        // }
      },
    );
  }
}
