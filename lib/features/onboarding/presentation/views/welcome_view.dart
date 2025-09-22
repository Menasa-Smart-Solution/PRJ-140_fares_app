import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/features/onboarding/presentation/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WelcomeViewBody().withPadding(horizontal: 20));
  }
}
