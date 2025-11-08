import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/profile/data/datasources/profile_data_source.dart';
import 'package:fares/features/profile/data/models/user_response_model.dart';

class ProfileRepo {
  final ProfileDataSource _dataSource;
  ProfileRepo({required ProfileDataSource dataSource})
    : _dataSource = dataSource;
  Future<Either<Failure, UserResponseModel>> getUserInfo() async {
    try {
      final userInfo = await _dataSource.getUserInfo();
      return Right(userInfo);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  Future<Either<Failure, void>> userLogout() async {
    try {
      await _dataSource.userLogout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
