part of '../../../feature_imports.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({super.key, required this.parcel});
  final ParcelModel parcel;

  @override
  State<OrderMenu> createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  late final List<String> options;

  @override
  void initState() {
    super.initState();
    options = [
      LocaleKeys.contactMerchant.tr(),
      LocaleKeys.whatsapp.tr(),
      LocaleKeys.storeChat.tr(),
      LocaleKeys.requestLocation.tr(),
      LocaleKeys.addCallLog.tr(),
    ];
  }

  Future<void> openStoreChat() async {
    // Implementation for opening store chat
  }

  Future<void> requestLocation() async {
    // Implementation for requesting location
  }

  Future<void> addCallLog() async {
    // Implementation for adding call log
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.primaryColor.withAlpha(15),
        ),
      ),

      icon: const Icon(Icons.more_horiz, color: AppColors.black),
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
          case String contactMerchantKey
              when contactMerchantKey == LocaleKeys.contactMerchant.tr():
            await makePhoneCall('2222222222');
            break;
          case String whatsappKey when whatsappKey == LocaleKeys.whatsapp.tr():
            await openWhatsApp(widget.parcel.recipientNumber ?? '');
            break;
          case String storeChatKey
              when storeChatKey == LocaleKeys.storeChat.tr():
            await openStoreChat();
            break;
          case String requestLocationKey
              when requestLocationKey == LocaleKeys.requestLocation.tr():
            await requestLocation();
            break;
          case String addCallLogKey
              when addCallLogKey == LocaleKeys.addCallLog.tr():
            context.pushNamed(
              Routes.callLogsRoute,
              arguments: widget.parcel.id,
            );
            break;
        }
      },
    );
  }
}
