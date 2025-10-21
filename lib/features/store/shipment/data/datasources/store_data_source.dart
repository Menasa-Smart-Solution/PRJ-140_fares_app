import 'package:fares/features/store/shipment/data/models/city_response_model.dart';
import 'package:fares/features/store/shipment/data/models/receipt_response_model.dart';

abstract class StoreDataSource {
  Future<CityResponseModel> getCities();
  Future<ReceiptResponseModel> getReceipts({int? page});
  Future<ReceiptResponseModel> getReceiptDetails({required int id});
}
