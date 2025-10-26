import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/home/data/datasources/home_data_source.dart';
import 'package:fares/features/driver/home/data/models/notifications_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';

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

  Future<Either<Failure, void>> logOut() async {
    try {
      final result = await homeDataSource.logOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, void>> receiveParcels(String parcelId) async {
    try {
      final result = await homeDataSource.receiveParcels(parcelId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, NotificationsResponseModel>> getAllNotifications({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final result = await homeDataSource.getAllNotifications(
        page: page,
        perPage: perPage,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }
}
