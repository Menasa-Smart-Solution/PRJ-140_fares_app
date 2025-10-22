import 'package:fares/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String getImage(String status) {
  switch (status) {
    case 'ConnectingNow':
      return AppImages.imagesDelivery;
    case 'FinancialSettlementPending':
      return AppImages.imagesAreDelivery;
    case 'RewindInProgress':
      return AppImages.imagesCanceled;
    case 'Delay':
      return AppImages.imagesDelivery;
    case 'UnderChecking':
      return AppImages.imagesUnderReviews;
    default:
      return AppImages.imagesAllOrders;
  }
}

String formatToArabicDate(String isoString) {
  try {
    final date = DateTime.parse(isoString);
    final formatter = DateFormat('d MMMM yyyy', 'ar');
    return formatter.format(date);
  } catch (e) {
    return isoString;
  }
}

String translateStatus(String status) {
  switch (status) {
    case "UnderPreparation":
      return "قيد الإعداد";
    case "charging":
      return "في الشركة";
    case "ConnectingNow":
      return "قيد التوصيل";
    case "FinancialSettlementPending":
      return "تم التسليم للزبون";
    case "Delay":
      return "قيد التسليم";
    case "outOfService":
      return "خارج التغطية";
    case "RewindInProgress":
      return "عدم اكتمال عمليه الشحن";
    case "Returned":
      return "تم الإسترداد";
    case "ReturnedAndReceived":
      return "مسترد للمتجر";
    case "Delivered":
      return "تم التوصيل";
    case "Closed":
      return "تم الإقفال";
    case "UnderChecking":
      return "قيد المراجعة";
    case "companyDues":
      return LocaleKeys.companyDues.tr();
    default:
      return "كل الشحنات"; // fallback لو الحالة مش موجودة
  }
}

Future<void> openWhatsApp(String phoneNumber) async {
  final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber");

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("WhatsApp is not installed on this device");
    // Or show a Snackbar, Dialog, or Toast message
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

  if (!await launchUrl(phoneUri)) {
    throw Exception('Could not make the call');
  }
}

Widget buildWidget(Widget widget, BuildContext context) {
  return SingleChildScrollView(
    child: SizedBox(
      height:
          MediaQuery.of(context).size.height -
          40 -
          kToolbarHeight -
          MediaQuery.of(context).padding.bottom -
          MediaQuery.of(context).padding.top,
      child: Center(child: widget),
    ),
  );
}
