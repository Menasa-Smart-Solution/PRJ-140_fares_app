part of '../../feature_imports.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppInfoCubit>()..getPrivacyPolicyInfo(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.privacyPolicy.tr()),
        body: const PrivacyPolicyBlocBuilder().withPadding(
          horizontal: 16,
          vertical: 25,
        ),
      ),
    );
  }
}
