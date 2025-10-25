import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/profile/data/datasources/profile_data_source.dart';
import 'package:fares/features/profile/data/models/user_response_model.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  final ApiService _apiService;

  ProfileDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<UserResponseModel> getUserInfo() async {
    try {
      final response = await _apiService.getUserInfo();
      AppLogger.log('ProfileDataSource: get user info successful');
      return response;
    } catch (e, s) {
      AppLogger.error('ProfileDataSource: get user info failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<void> userLogout() async {
    try {
      await _apiService.logOut();
      AppLogger.log('ProfileDataSource: user logout successful');
    } catch (e, s) {
      AppLogger.error('ProfileDataSource: user logout failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
