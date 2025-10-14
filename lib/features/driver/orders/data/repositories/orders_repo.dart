import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/orders/data/datasources/orders_data_source.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';

class OrdersRepo {
  final OrdersDataSource _ataSource;
  OrdersRepo(this._ataSource);

  Future<Either<Failure, ParcelsResponseModel>> getOrders({
    String? status,
    String? id,
    int? page,
  }) async {
    try {
      final result = await _ataSource.getOrders(
        status: status,
        id: id,
        page: page,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, CallImagesResponse>> getCallImages({
    required int parcelId,
  }) async {
    try {
      final result = await _ataSource.getCallImages(parcelId: parcelId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, void>> updateOrderStatus({
    required ChangeOrderStatusRequest body,
  }) async {
    try {
      final result = await _ataSource.updateOrderStatus(body: body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, void>> partialOrderStatus({
    required PartialDeliveryRequest body,
  }) async {
    try {
      final result = await _ataSource.partialOrderStatus(body: body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, CancelOrderReasonsResponse>>
  getCancelOrderReasons() async {
    try {
      final result = await _ataSource.reasons();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }
}
