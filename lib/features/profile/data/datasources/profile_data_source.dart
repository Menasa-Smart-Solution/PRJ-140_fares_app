import 'package:fares/features/profile/data/models/user_response_model.dart';

abstract class ProfileDataSource {
  Future<UserResponseModel> getUserInfo();
  Future<void> userLogout();
}
