import 'package:fares/core/di/dependency_injection.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:fares/features/auth/presentation/widgets/login/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: const LoginViewBody().withPadding(horizontal: 20, vertical: 26),
      ),
    );
  }
}
