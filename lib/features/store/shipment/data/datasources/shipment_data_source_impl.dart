import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/store/shipment/data/datasources/shipment_data_source.dart';
import 'package:fares/features/store/shipment/data/models/create_parcels_request_body.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/data/models/store_collect_request_model.dart';

import '../../../../../core/network/api_service.dart';

class ShipmentDataSourceImpl extends ShipmentDataSource {
  final ApiService _apiService;
  ShipmentDataSourceImpl(this._apiService);
  @override
  Future<void> createStoreCollects({
    required StoreCollectRequestModel body,
  }) async {
    try {
      final response = await _apiService.createStoreCollects(body: body);
      AppLogger.log('ShipmentDataSource: Create StoreCollects Success');
      return response;
    } catch (e) {
      AppLogger.log('ShipmentDataSource: Create StoreCollects Failed: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<void> createShipment({required CreateParcelsRequestBody body}) async {
    try {
      final fromData = await body.toFormData();
      final response = await _apiService.createParcels(body: fromData);
      AppLogger.log('ShipmentDataSource: Create Shipment Success');
      return response;
    } catch (e) {
      AppLogger.log('ShipmentDataSource: Create Shipment Failed: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<ProductsResponseModel> getProducts() async {
    try {
      final response = await _apiService.getProducts();
      AppLogger.info('ShipmentDataSource: Get Products Success: $response');
      return response;
    } catch (e) {
      AppLogger.error('ShipmentDataSource: Get Products Error: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
