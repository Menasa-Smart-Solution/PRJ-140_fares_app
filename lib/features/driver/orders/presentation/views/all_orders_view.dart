part of '../../feature_imports.dart';

class AllOrdersView extends StatelessWidget {
  const AllOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.shippingStatusUnderReview.tr()),
      body: const AllOrdersViewBody().withPadding(vertical: 20, horizontal: 16),
    );
  }
}
