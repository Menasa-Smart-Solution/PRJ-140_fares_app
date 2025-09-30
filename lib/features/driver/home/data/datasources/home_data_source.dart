import 'package:fares/features/driver/home/data/models/summary_response_model.dart';

abstract class HomeDataSource {
  Future<SummaryResponseModel> getAllSummary();
}
