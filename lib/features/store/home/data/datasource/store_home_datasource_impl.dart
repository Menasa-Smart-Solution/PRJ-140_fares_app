import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/store/home/data/datasource/store_home_datasource.dart';
import 'package:fares/features/store/home/data/models/create_ticket_request_model.dart';
import 'package:fares/features/store/home/data/models/store_home_response_model.dart';
import 'package:fares/features/store/home/data/models/tickets_response_models.dart';

class StoreHomeDatasourceImpl extends StoreHomeDataSource {
  final ApiService _apiService;
  StoreHomeDatasourceImpl(this._apiService);
  @override
  Future<void> createTickets({required CreateTicketRequestModel body}) async {
    try {
      final response = await _apiService.createTickets(body: body);
      AppLogger.info('StoreHomeDataSourceImpl: Create Tickets Success');

      return response;
    } catch (e) {
      AppLogger.error('StoreHomeDataSourceImpl: Create Tickets Failed', e);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<TicketsResponseModels> getTickets() async {
    try {
      final response = await _apiService.getTickets();
      AppLogger.info('StoreHomeDataSourceImpl: Get Tickets Success');
      return response;
    } catch (e) {
      AppLogger.error('StoreHomeDataSourceImpl: Get Tickets Failed', e);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<StoreHomeResponseModel> getStoreHome() async {
    try {
      final response = await _apiService.getStoreHome();
      AppLogger.info('StoreHomeDataSourceImpl: Get Store Home Success');
      return response;
    } catch (e) {
      AppLogger.error('StoreHomeDataSourceImpl: Get Store Home Failed', e);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<void> logout() async {
    try {
      final response = await _apiService.logOut();
      AppLogger.info('StoreHomeDataSourceImpl: Logout Success');

      return response;
    } catch (e) {
      AppLogger.error('StoreHomeDataSourceImpl: Logout Failed', e);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
