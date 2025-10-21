import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/store/prices/data/datasource/prices_data_source.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';

class PricesRepo {
  final PricesDataSource storeDataSource;

  PricesRepo(this.storeDataSource);

  Future<Either<Failure, CityResponseModel>> getCities() async {
    try {
      final result = await storeDataSource.getCities();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  Future<Either<Failure, ReceiptResponseModel>> getReceiptDetails({
    required int id,
  }) async {
    try {
      final result = await storeDataSource.getReceiptDetails(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  Future<Either<Failure, ReceiptResponseModel>> getReceipts({int? page}) async {
    try {
      final result = await storeDataSource.getReceipts(page: page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
