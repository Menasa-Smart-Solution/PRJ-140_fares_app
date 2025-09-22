import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/widgets/change_password/change_password_view_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ChangePasswordViewBody().withPadding(vertical: 20, horizontal: 16),
    );
  }
}
