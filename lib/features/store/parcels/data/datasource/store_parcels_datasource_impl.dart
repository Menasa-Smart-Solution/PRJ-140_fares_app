import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/store/parcels/data/datasource/store_parcels_datasource.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_details_response_model.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';

class StoreParcelsDatasourceImpl implements StoreParcelsDataSource {
  final ApiService _apiService;
  StoreParcelsDatasourceImpl(this._apiService);

  @override
  Future<StoreParcelsDetailsResponseModel> getStoreParcelDetails(int id) async {
    try {
      final response = await _apiService.getStoreParcelDetails(id: id);
      AppLogger.info(
        'StoreParcelsDatasource: Get StoreParcelDetails Success: $response',
      );
      return response;
    } catch (e) {
      AppLogger.error(
        'StoreParcelsDatasource: Get StoreParcelDetails Error: $e',
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<StoreParcelsResponseModel> getStoreParcels({
    String? status,
    String? id,
    int? page,
  }) async {
    try {
      final response = await _apiService.getStoreParcels(
        status: status,
        id: id,
        page: page,
      );
      AppLogger.info(
        'StoreParcelsDatasource: Get StoreParcels Success: $response',
      );
      return response;
    } catch (e) {
      AppLogger.error('StoreParcelsDatasource: Get StoreParcels Error: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<void> deleteParcel({required int id}) async {
    try {
      await _apiService.deleteParcel(id: id);
      AppLogger.info('StoreParcelsDatasource: Delete Parcel Success: ID $id');
    } catch (e) {
      AppLogger.error('StoreParcelsDatasource: Delete Parcel Error: $e');
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
