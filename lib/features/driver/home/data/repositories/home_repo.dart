import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/home/data/datasources/home_data_source.dart';
import 'package:fares/features/driver/home/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';
import 'package:fares/generated/locale_keys.g.dart';

class HomeRepo {
  final HomeDataSource homeDataSource;
  HomeRepo({required this.homeDataSource});

  Future<Either<Failure, SummaryResponseModel>> getAllSummary() async {
    try {
      final result = await homeDataSource.getAllSummary();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, ParcelsResponseModel>> getParcels({
    String? status,
    int? id,
    int? page,
  }) async {
    try {
      final result = await homeDataSource.getParcels(
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
