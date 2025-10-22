part of '../../feature_imports.dart';

class CollectionSettlementsView extends StatelessWidget {
  const CollectionSettlementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReceiptsCubit>()..getReceipts(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.financialSettlement.tr()),
        body: const CollectionSettlementsViewBody(),
      ),
    );
  }
}
