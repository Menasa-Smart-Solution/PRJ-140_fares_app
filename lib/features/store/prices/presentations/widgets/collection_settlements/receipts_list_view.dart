part of '../../../feature_imports.dart';

class ReceiptsListView extends StatelessWidget {
  const ReceiptsListView({super.key, required this.receipts});
  final List<ReceiptModel> receipts;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: receipts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return SettlementCard(receiptModel: receipts[index]);
      },
    );
  }
}
