import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/store/app_info/data/datasource/app_info_datasource.dart';
import 'package:fares/features/store/app_info/data/models/contact_us_response_model.dart';
import 'package:fares/features/store/app_info/data/models/privacy_policy_response_model.dart';

class AppInfoRepo {
  final AppInfoDatasource _datasource;

  AppInfoRepo({required AppInfoDatasource datasource})
    : _datasource = datasource;

  Future<Either<Failure, ContactUsResponseModel>> getContactUsInfo() async {
    try {
      final response = await _datasource.getContactUsInfo();
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  Future<Either<Failure, PrivacyPolicyResponseModel>>
  getPrivacyPolicyInfo() async {
    try {
      final response = await _datasource.getPrivacyPolicyInfo();
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
