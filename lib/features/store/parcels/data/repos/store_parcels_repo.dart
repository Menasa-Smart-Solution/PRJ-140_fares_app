import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/store/parcels/data/datasource/store_parcels_datasource.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';

class StoreParcelsRepo {
  final StoreParcelsDataSource _dataSource;
  StoreParcelsRepo(this._dataSource);

  Future<Either<Failure, List<StoreParcelModel>>> getStoreParcels({
    String? status,
    String? id,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getStoreParcels(
        status: status,
        id: id,
        page: page,
      );
      return Right(response.data.parcels);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  Future<Either<Failure, StoreParcelModel>> getStoreParcelDetails(
    int id,
  ) async {
    try {
      final response = await _dataSource.getStoreParcelDetails(id);
      return Right(response.data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
