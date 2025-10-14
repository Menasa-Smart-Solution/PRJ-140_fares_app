import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:fares/features/auth/data/models/branches_response_model.dart';
import 'package:fares/features/auth/data/models/message_response_model.dart';
import 'package:fares/features/auth/data/models/register_request_model.dart';
import 'package:fares/features/auth/data/models/register_response_model.dart';
import 'package:fares/features/auth/data/models/reset_password_request_model.dart';
import 'package:fares/features/auth/data/models/send_otp_request_model.dart';
import 'package:fares/features/auth/data/models/verify_otp_request_model.dart';

abstract class AuthDataSource {
  Future<AuthResponseModel> login(LoginRequestModel body);
  Future<RegisterResponseModel> register(RegisterRequestModel body);
  Future<MessageResponseModel> resetPassword(ResetPasswordRequestModel body);
  Future<MessageResponseModel> sendOtp(SendOtpRequestModel body);
  Future<MessageResponseModel> verifyOtp(VerifyOtpRequestModel body);
  Future<BranchesResponseModel> getAllBranches();
}
