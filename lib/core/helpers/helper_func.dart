import 'package:fares/core/utils/app_images.dart';

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
