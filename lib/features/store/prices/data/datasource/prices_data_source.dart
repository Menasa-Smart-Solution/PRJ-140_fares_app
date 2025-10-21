import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';

abstract class PricesDataSource {
  Future<CityResponseModel> getCities();
  Future<ReceiptResponseModel> getReceipts({int? page});
  Future<ReceiptResponseModel> getReceiptDetails({required int id});
}
