import 'package:fares/core/utils/app_images.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
    default:
      return "كل الشحنات"; // fallback لو الحالة مش موجودة
  }
}
