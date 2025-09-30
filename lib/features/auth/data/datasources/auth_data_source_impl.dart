import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/auth/data/datasources/auth_data_source.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final ApiService _apiService;

  AuthDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<AuthResponseModel> login(LoginRequestModel body) async {
    try {
      final response = await _apiService.login(body);
      AppLogger.log('Login Success: $response');
      return response;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Login Failed: ${ErrorHandler.handle(e).message!}',
        e,
        stackTrace,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
