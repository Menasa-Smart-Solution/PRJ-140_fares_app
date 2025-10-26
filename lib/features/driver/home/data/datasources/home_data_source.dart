import 'package:fares/features/driver/home/data/models/notifications_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';

abstract class HomeDataSource {
  Future<SummaryResponseModel> getAllSummary();
  Future<void> logOut();
  Future<void> receiveParcels(String parcelId);
  Future<NotificationsResponseModel> getAllNotifications({
    int page = 1,
    int perPage = 10,
  });
}
