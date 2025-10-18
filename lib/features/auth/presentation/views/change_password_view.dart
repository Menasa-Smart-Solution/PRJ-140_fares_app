import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/change_password/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key, required this.params});
  final ChangePasswordParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: ChangePasswordViewBody(
          params: params,
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}

class ChangePasswordParams {
  final String email;
  final String otp;

  ChangePasswordParams({required this.email, required this.otp});
}
