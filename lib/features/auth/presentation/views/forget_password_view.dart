import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/widgets/forget_password/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ForgetPasswordViewBody().withPadding(horizontal: 16, vertical: 20),
    );
  }
}
