import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/cubit/reset_password/forget_password_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/forget_password/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: const ForgetPasswordViewBody().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
