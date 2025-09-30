import 'package:dio/dio.dart';
import 'package:fares/core/network/api_constants.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() LoginRequestModel body);
}
