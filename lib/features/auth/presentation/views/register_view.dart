import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/register/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..getAllBranches(),
      child: Scaffold(
        body: const RegisterViewBody().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
