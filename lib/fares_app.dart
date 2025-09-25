import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/routing/app_router.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FaresApp extends StatelessWidget {
  const FaresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fares App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        fontFamily: AppTextStyles.fontFamily,
        appBarTheme: const AppBarThemeData(
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
      ),
      navigatorKey: AppRouter.navigatorKey,
      onGenerateRoute: AppRouter().onGenerateRoute,
      initialRoute: Routes.onBoardingRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 800, name: TABLET),
          // const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          // const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
