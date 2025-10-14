import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
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

class AuthDataSourceImpl extends AuthDataSource {
  final ApiService _apiService;

  AuthDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<AuthResponseModel> login(LoginRequestModel body) async {
    try {
      final response = await _apiService.login(body);
      AppLogger.log('Login Success');
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

  @override
  Future<BranchesResponseModel> getAllBranches() async {
    try {
      final response = await _apiService.getBranches();
      AppLogger.log('Get All Branches Success');
      return response;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Get All Branches Failed: ${ErrorHandler.handle(e).message!}',
        e,
        stackTrace,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel body) async {
    try {
      final response = await _apiService.register(body);
      AppLogger.log('Register Success');
      return response;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Register Failed: ${ErrorHandler.handle(e).message!}',
        e,
        stackTrace,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<MessageResponseModel> resetPassword(
    ResetPasswordRequestModel body,
  ) async {
    try {
      final response = await _apiService.resetPassword(body);
      AppLogger.log('Reset Password Success');
      return response;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Reset Password Failed: ${ErrorHandler.handle(e).message!}',
        e,
        stackTrace,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<MessageResponseModel> sendOtp(SendOtpRequestModel body) async {
    try {
      final response = await _apiService.sendOtp(body: body);
      AppLogger.log('Send OTP Success');
      return response;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Send OTP Failed: ${ErrorHandler.handle(e).message!}',
        e,
        stackTrace,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<MessageResponseModel> verifyOtp(VerifyOtpRequestModel body) async {
    try {
      final response = await _apiService.verifyOtp(body);
      AppLogger.log('Verify OTP Success');
      return response;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Verify OTP Failed: ${ErrorHandler.handle(e).message!}',
        e,
        stackTrace,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
