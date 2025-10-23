import 'dart:io';
import 'package:fares/core/routing/page_route_animation.dart';
import 'package:fares/core/routing/routes.dart';
import 'package:fares/features/auth/presentation/views/change_password_view.dart';
import 'package:fares/features/auth/presentation/views/forget_password_view.dart';
import 'package:fares/features/auth/presentation/views/login_view.dart';
import 'package:fares/features/auth/presentation/views/password_changed_success_view.dart';
import 'package:fares/features/auth/presentation/views/register_view.dart';
import 'package:fares/features/auth/presentation/views/verification_code_view.dart';
import 'package:fares/features/driver/chat/feature_imports.dart';
import 'package:fares/features/driver/home/presentation/widgets/widgets.dart';
import 'package:fares/features/driver/main/presentations/driver_main.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/feature_imports.dart';
import 'package:fares/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fares/features/onboarding/presentation/views/welcome_view.dart';
import 'package:fares/features/profile/feature_imports.dart';
import 'package:fares/features/store/parcels/feature_imports.dart';
import 'package:fares/features/store/shipment/feature_imports.dart';
import 'package:flutter/material.dart';

import '../../features/store/prices/feature_imports.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
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
        return _buildRoute(
          builder: (_) => VerificationCodeView(email: args as String),
        );
      case Routes.forgetPasswordRoute:
        return _buildRoute(builder: (_) => const ForgetPasswordView());
      case Routes.changePasswordRoute:
        return _buildRoute(
          builder: (_) =>
              ChangePasswordView(params: args as ChangePasswordParams),
        );
      case Routes.passwordChangedSuccessRoute:
        return _buildRoute(builder: (_) => const PasswordChangedSuccessView());
      case Routes.homeRoute:
        return _buildRoute(builder: (_) => const HomeView());
      case Routes.notificationsRoute:
        return _buildRoute(builder: (_) => const NotificationsView());
      case Routes.trackOrderRoute:
        return _buildRoute(
          builder: (_) => TrackOrderView(parcel: args as ParcelModel),
        );
      case Routes.allOrdersRoute:
        return _buildRoute(
          builder: (_) => AllOrdersView(params: args as AllOrdersParams),
        );

      case Routes.orderQrCodeRoute:
        return _buildRoute(
          builder: (_) => OrderQrCodeView(isConfirmOrder: args as bool),
        );
      case Routes.conversationRoute:
        return _buildRoute(builder: (_) => const ConversationsView());
      case Routes.chatRoute:
        return _buildRoute(
          builder: (_) => ChatView(chatParam: args as ChatParam),
        );
      case Routes.searchRoute:
        return _buildRoute(builder: (_) => const SearchView());
      case Routes.profileRoute:
        return _buildRoute(builder: (_) => const EditProfileView());

      case Routes.updatePasswordRoute:
        return _buildRoute(builder: (_) => const UpdatePasswordView());
      case Routes.mainDriverRoute:
        return _buildRoute(builder: (_) => const DriverMain());
      case Routes.callLogsRoute:
        return _buildRoute(builder: (_) => CallLogsView(id: args as int));
      case Routes.createShipmentRoute:
        return _buildRoute(builder: (_) => const CreateShipmentView());
      case Routes.addCollectionRequestRoute:
        return _buildRoute(builder: (_) => const AddCollectionRequestView());
      case Routes.collectionSettlementsRoute:
        return _buildRoute(builder: (_) => const CollectionSettlementsView());
      case Routes.financialSettlementRoute:
        return _buildRoute(
          builder: (_) => FinancialSettlementView(id: args as int),
        );
      case Routes.storeParcelsRoute:
        return _buildRoute(builder: (_) => const StoreParcelsView());
      case Routes.storeParcelDetailsRoute:
        return _buildRoute(
          builder: (_) => StoreParcelDetailsView(parcelId: args as int),
        );
      case Routes.citiesPricesRoute:
        return MaterialPageRoute(builder: (_) => const CitiesPricesView());
      case Routes.contactInfoRoute:
        return MaterialPageRoute(builder: (_) => const ContactInfoView());

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
