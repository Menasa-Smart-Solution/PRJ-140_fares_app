import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/data/datasources/auth_data_source.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:fares/features/auth/data/models/branches_response_model.dart';
import 'package:fares/features/auth/data/models/message_response_model.dart';
import 'package:fares/features/auth/data/models/register_request_model.dart';
import 'package:fares/features/auth/data/models/register_response_model.dart';
import 'package:fares/features/auth/data/models/reset_password_request_model.dart';
import 'package:fares/features/auth/data/models/send_otp_request_model.dart';
import 'package:fares/features/auth/data/models/verify_otp_request_model.dart';

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

  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequestModel body,
  ) async {
    try {
      final response = await _dataSource.register(body);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, MessageResponseModel>> resetPassword(
    ResetPasswordRequestModel body,
  ) async {
    try {
      final response = await _dataSource.resetPassword(body);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, MessageResponseModel>> sendOtp(
    SendOtpRequestModel body,
  ) async {
    try {
      final response = await _dataSource.sendOtp(body);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, MessageResponseModel>> verifyOtp(
    VerifyOtpRequestModel body,
  ) async {
    try {
      final response = await _dataSource.verifyOtp(body);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, BranchesResponseModel>> getAllBranches() async {
    try {
      final response = await _dataSource.getAllBranches();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: LocaleKeys.unknown.tr()));
    }
  }
}
