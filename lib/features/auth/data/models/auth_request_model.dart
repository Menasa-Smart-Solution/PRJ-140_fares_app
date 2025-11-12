class LoginRequestModel {
  final String email;
  final String password;
  final String? deviceToken;

  LoginRequestModel({
    required this.email,
    required this.password,
    this.deviceToken,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'fcm_token': deviceToken};
  }
}
