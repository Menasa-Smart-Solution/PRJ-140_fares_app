part of '../../feature_imports.dart';

class CollectionSettlementsView extends StatelessWidget {
  const CollectionSettlementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.financialSettlement.tr()),
      body: const CollectionSettlementsViewBody(),
    );
  }
}
