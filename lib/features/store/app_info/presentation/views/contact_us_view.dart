part of '../../feature_imports.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppInfoCubit>()..getContactUsInfo(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.contactUs.tr()),
        body: const ContactUsBlocBuilder().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
