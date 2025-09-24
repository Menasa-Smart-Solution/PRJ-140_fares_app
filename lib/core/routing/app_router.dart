import 'dart:io';
import 'package:fares/core/routing/page_route_animation.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/features/auth/presentation/views/change_password_view.dart';
import 'package:fares/features/auth/presentation/views/forget_password_view.dart';
import 'package:fares/features/auth/presentation/views/login_view.dart';
import 'package:fares/features/auth/presentation/views/password_changed_success_view.dart';
import 'package:fares/features/auth/presentation/views/register_view.dart';
import 'package:fares/features/auth/presentation/views/verification_code_view.dart';
import 'package:fares/features/driver/home/presentation/widgets/widgets.dart';
import 'package:fares/features/driver/orders/feature_imports.dart';
import 'package:fares/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fares/features/onboarding/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingRoute:
        return _buildRoute(builder: (_) => const OnBoardingView());
      case Routes.welcomeRoute:
        return _buildRoute(builder: (_) => const WelcomeView());
      case Routes.loginRoute:
        return _buildRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return _buildRoute(builder: (_) => const RegisterView());
      case Routes.verificationCodeRoute:
        return _buildRoute(builder: (_) => const VerificationCodeView());
      case Routes.forgetPasswordRoute:
        return _buildRoute(builder: (_) => const ForgetPasswordView());
      case Routes.changePasswordRoute:
        return _buildRoute(builder: (_) => const ChangePasswordView());
      case Routes.passwordChangedSuccessRoute:
        return _buildRoute(builder: (_) => const PasswordChangedSuccessView());
      case Routes.homeRoute:
        return _buildRoute(builder: (_) => const HomeView());
      case Routes.notificationsRoute:
        return _buildRoute(builder: (_) => const NotificationsView());
      case Routes.trackOrderRoute:
        return _buildRoute(builder: (_) => const TrackOrderView());

      default:
        return null;
    }
  }

  PageRoute _buildRoute({required WidgetBuilder builder}) {
    return Platform.isAndroid
        ? FadePageRoute(builder: builder)
        : MaterialPageRoute(builder: builder);
  }
}
