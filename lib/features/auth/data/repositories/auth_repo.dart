import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/data/datasources/auth_data_source.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';

class AuthRepo {
  final AuthDataSource _dataSource;

  AuthRepo({required AuthDataSource dataSource}) : _dataSource = dataSource;

  Future<Either<Failure, AuthResponseModel>> login(
    LoginRequestModel body,
  ) async {
    try {
      final response = await _dataSource.login(body);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: LocaleKeys.unknown.tr()));
    }
  }
}
