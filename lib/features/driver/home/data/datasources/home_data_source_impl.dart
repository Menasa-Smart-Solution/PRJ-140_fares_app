import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/driver/home/data/datasources/home_data_source.dart';
import 'package:fares/features/driver/home/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final ApiService _apiService;

  HomeDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<SummaryResponseModel> getAllSummary() async {
    try {
      final response = await _apiService.getAllSummary();
      AppLogger.log('Home Data Source: get all summary success');
      return response;
    } catch (e, s) {
      AppLogger.error('Home Data Source: get all summary failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<ParcelsResponseModel> getParcels({
    String? status,
    int? id,
    int? page,
  }) async {
    try {
      final response = await _apiService.getParcels(
        status: status,
        id: id,
        page: page,
      );
      AppLogger.log('Home Data Source: get parcels success');
      return response;
    } catch (e, s) {
      AppLogger.error('Home Data Source: get parcels failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
