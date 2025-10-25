import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/app_info/data/datasource/app_info_datasource.dart';
import 'package:fares/features/store/app_info/data/models/contact_us_response_model.dart';
import 'package:fares/features/store/app_info/data/models/privacy_policy_response_model.dart';

class AppInfoDatasourceImpl extends AppInfoDatasource {
  final ApiService _apiService;

  AppInfoDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<ContactUsResponseModel> getContactUsInfo() async {
    try {
      final response = await _apiService.getContactUsInfo();
      AppLogger.log("AppInfoDatasource:get ContactUsInfo success");
      return response;
    } catch (e) {
      AppLogger.error("AppInfoDatasource:get ContactUsInfo failed: $e");
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<PrivacyPolicyResponseModel> getPrivacyPolicyInfo() async {
    try {
      final response = await _apiService.getPrivacyPolicyInfo();
      AppLogger.log("AppInfoDatasource:get PrivacyPolicyInfo success");
      return response;
    } catch (e) {
      AppLogger.error("AppInfoDatasource:get PrivacyPolicyInfo failed: $e");
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
