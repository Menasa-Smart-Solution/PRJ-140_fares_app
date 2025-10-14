import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/data/datasources/orders_data_source.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';

import '../../../../../core/utils/app_logger.dart';

class OrdersDataSourceImpl implements OrdersDataSource {
  final ApiService _apiService;

  OrdersDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<ParcelsResponseModel> getOrders({
    String? status,
    String? id,
    int? page,
  }) async {
    try {
      final response = await _apiService.getParcels(
        status: status,
        id: id,
        page: page,
      );
      AppLogger.log(
        'Orders Data Source: get parcels success:${response.data!.parcels?.data!.length}',
      );
      return response;
    } catch (e, s) {
      AppLogger.error('Orders Data Source: get parcels failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<CallImagesResponse> getCallImages({required int parcelId}) async {
    try {
      final response = await _apiService.getCallImages(parcelId: parcelId);
      AppLogger.log(
        'Orders Data Source: get call images success:${response.images.length}',
      );
      return response;
    } catch (e, s) {
      AppLogger.error('Orders Data Source: get call images failed', e, s);
      final message = ErrorHandler.handle(e).message!;
      AppLogger.error('Orders Data Source: $message', e, s);
      throw ServerException(message: message);
    }
  }

  @override
  Future<void> partialOrderStatus({
    required PartialDeliveryRequest body,
  }) async {
    try {
      await _apiService.partialDelivery(body: body);
      AppLogger.log('Orders Data Source: partial order status success');
    } catch (e, s) {
      AppLogger.error('Orders Data Source: partial order status failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<void> updateOrderStatus({
    required ChangeOrderStatusRequest body,
  }) async {
    try {
      await _apiService.changeStatus(body: body);
      AppLogger.log('Orders Data Source: update order status success');
    } catch (e, s) {
      AppLogger.error('Orders Data Source: update order status failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<CancelOrderReasonsResponse> reasons() async {
    try {
      final response = await _apiService.getCancelOrderReasons();
      AppLogger.log(
        'Orders Data Source: get cancel order reasons success:${response.reasons.length}',
      );
      return response;
    } catch (e, s) {
      AppLogger.error(
        'Orders Data Source: get cancel order reasons failed',
        e,
        s,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
