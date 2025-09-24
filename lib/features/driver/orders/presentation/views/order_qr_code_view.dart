part of '../../feature_imports.dart';

class OrderQrCodeView extends StatelessWidget {
  const OrderQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.deliverShipment.tr()),
      body: const OrderQrCodeViewBody().withPadding(
        vertical: 20,
        horizontal: 16,
      ),
    );
  }
}
