import 'dart:io';

import 'package:fares/core/routing/page_route_animation.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/features/auth/presentation/views/login_view.dart';
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
