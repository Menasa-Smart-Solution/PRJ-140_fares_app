import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';

abstract class HomeDataSource {
  Future<SummaryResponseModel> getAllSummary();
}
