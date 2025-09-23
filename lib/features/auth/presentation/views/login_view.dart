import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/widgets/login/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody().withPadding(horizontal: 20, vertical: 26),
    );
  }
}
