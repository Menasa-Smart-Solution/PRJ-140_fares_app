import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/verification_code/verification_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: VerificationCodeViewBody(
          email: email,
        ).withPadding(horizontal: 16, vertical: 20),
      ),
    );
  }
}
