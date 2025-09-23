import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/widgets/register/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody().withPadding(horizontal: 16, vertical: 20),
    );
  }
}
