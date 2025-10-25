import 'package:fares/features/store/app_info/data/models/contact_us_response_model.dart';
import 'package:fares/features/store/app_info/data/models/privacy_policy_response_model.dart';

abstract class AppInfoDatasource {
  Future<ContactUsResponseModel> getContactUsInfo();
  Future<PrivacyPolicyResponseModel> getPrivacyPolicyInfo();
}
