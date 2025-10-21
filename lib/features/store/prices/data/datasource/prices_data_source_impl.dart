import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/store/prices/data/datasource/prices_data_source.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';

class PricesDataSourceImpl extends PricesDataSource {
  final ApiService _apiService;

  PricesDataSourceImpl(this._apiService);

  @override
  Future<CityResponseModel> getCities() async {
    try {
      final response = await _apiService.getCities();
      AppLogger.info('StoreDataSourceImpl: Get Cities Success');
      return response;
    } catch (e) {
      AppLogger.error('StoreDataSourceImpl: Get Cities Failed: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<ReceiptResponseModel> getReceiptDetails({required int id}) async {
    try {
      final response = await _apiService.getReceiptDetails(id: id);
      AppLogger.info('StoreDataSourceImpl: Get Receipt Details Success');
      return response;
    } catch (e) {
      AppLogger.error('StoreDataSourceImpl: Get Receipt Details Failed: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<ReceiptResponseModel> getReceipts({int? page}) async {
    try {
      final response = await _apiService.getReceipts(page: page);
      AppLogger.info('StoreDataSourceImpl: Get Receipts Success');
      return response;
    } catch (e) {
      AppLogger.error('StoreDataSourceImpl: Get Receipts Failed: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
