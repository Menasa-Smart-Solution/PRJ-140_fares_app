part of '../../feature_imports.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.privacyPolicy.tr()),
      body: const Center(child: Text('Privacy Policy Content Goes Here')),
    );
  }
}
