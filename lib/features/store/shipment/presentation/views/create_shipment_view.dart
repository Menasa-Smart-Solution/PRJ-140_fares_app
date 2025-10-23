part of '../../feature_imports.dart';

class CreateShipmentView extends StatelessWidget {
  const CreateShipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.addShipment.tr()),
      body: const CreateShipmentViewBody().withPadding(
        horizontal: 16,
        vertical: 20,
      ),
    );
  }
}
