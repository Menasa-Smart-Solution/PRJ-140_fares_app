import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';

abstract class AuthDataSource {
  Future<AuthResponseModel> login(LoginRequestModel body);
}
