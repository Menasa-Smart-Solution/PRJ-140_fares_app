import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/orders/data/datasources/orders_data_source.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';

class OrdersRepo {
  final OrdersDataSource _ataSource;
  OrdersRepo(this._ataSource);

  Future<Either<Failure, ParcelsResponseModel>> getOrders({
    String? status,
    int? id,
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
}
