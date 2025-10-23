import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_details_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';

abstract class PricesDataSource {
  Future<CityResponseModel> getCities();
  Future<ReceiptResponseModel> getReceipts({int page = 1});
  Future<ReceiptDetailsResponseModel> getReceiptDetails({required int id});
}
