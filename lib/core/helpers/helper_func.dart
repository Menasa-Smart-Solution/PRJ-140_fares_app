import 'package:fares/core/utils/exports.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

String getImage(String status) {
  switch (status) {
    case 'ConnectingNow':
      return AppImages.imagesConnectingNow;
    case 'charging':
      return AppImages.imagesCharging;
    case 'FinancialSettlementPending':
      return AppImages.imagesFinancialSettlementPending;
    case 'RewindInProgress':
      return AppImages.imagesRewindInProgress;
    case 'Delay':
      return AppImages.imagesDelay;
    case 'UnderChecking':
      return AppImages.imagesUnderChecking;
    case 'chats':
      return AppImages.imagesChats;
    case 'UnderPreparation':
      return AppImages.imagesUnderPreparation;
    case 'Closed':
      return AppImages.imagesClosed;
    case 'Delivered':
      return AppImages.imagesDelivered;
    case 'preparedInWarehouse':
      return AppImages.imagesPreparedInWarehouse;
    case 'Returned':
      return AppImages.imagesReturned;
    case 'ReturnedAndReceived':
      return AppImages.imagesReturnedAndReceived;
    default:
      return AppImages.imagesConnectingNow;
  }
}

String getStatusNameAr(String id) {
  switch (id) {
    case 'DeliveryReturnToBranch':
      return 'قيد الإسترداد للفرع';
    case 'onGoingUnderBranchSettlement':
      return 'قيد التسوية مع الفرع';
    case 'UnderBranchSettlement':
      return 'بإنتظار تسوية الفرع';
    case 'DeliveryToBranch':
      return 'قيد التوصيل للفرع';
    case 'ReturnedInWarehouse':
      return 'مسترد بالمخزن';
    case 'UnderAudit':
      return 'قيـد المراجعة في المستودع';
    case 'ReturnToCompany':
      return 'قيد الإسترداد للشركة';
    case 'WaitingForDelivery':
      return 'قيد إستلام المندوب';
    case 'UnderCollection':
      return 'بإنتظار التجميع';
    case 'UnderPreparation':
      return 'عند العميل';
    case 'charging':
      return 'قيد التجهيز';
    case 'preparedInWarehouse':
      return 'في الشركة';
    case 'ConnectingNow':
      return 'قيد التوصيل';
    case 'UnderChecking':
      return 'قيد المراجعة';
    case 'RewindInProgress':
      return 'عدم اكتمال عملية الشحن';
    case 'WaitingDelivery':
      return 'بانتظار الشحن';
    case 'UnderDelivery':
      return 'قيد التوصيل';
    case 'CustomerDelivered':
      return 'تم التسليم للزبون';
    case 'CompanyDelivered':
      return 'تم التسليم للشركة';
    case 'Delay':
      return 'قيد التسليم';
    case 'Returned':
      return 'مسترد في الشركة';
    case 'FinancialSettlementPending':
      return 'تم التسليم ';
    case 'ReturnedAndReceived':
      return 'مسترد للمتجر';
    case 'Delivered':
      return 'تحت تسوية الشركة';
    case 'Closed':
      return 'مكتملة';
    default:
      return 'غير معروف'; // في حال الـ id مش موجود
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

String formatToArabicDate(String isoString) {
  try {
    final date = DateTime.parse(isoString);
    final formatter = DateFormat('d MMMM yyyy', 'en');
    return formatter.format(date);
  } catch (e) {
    return isoString;
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
          220 -
          kToolbarHeight -
          MediaQuery.of(context).padding.bottom -
          MediaQuery.of(context).padding.top,
      child: Center(child: widget),
    ),
  );
}

class NullableStringConverter implements JsonConverter<String?, dynamic> {
  const NullableStringConverter();

  @override
  String? fromJson(dynamic json) {
    if (json == null) return null;
    return json.toString();
  }

  @override
  dynamic toJson(String? object) => object;
}

class StringConverter implements JsonConverter<String, dynamic> {
  const StringConverter();

  @override
  String fromJson(dynamic json) => json?.toString() ?? '';

  @override
  dynamic toJson(String object) => object;
}
