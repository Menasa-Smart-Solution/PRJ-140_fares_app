part of '../../../feature_imports.dart';

class FinancialSettlementViewBody extends StatelessWidget {
  const FinancialSettlementViewBody({super.key, required this.receiptModel});
  final ReceiptModel receiptModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverToBoxAdapter(
          child: SettlementInfoCard(receiptModel: receiptModel),
        ),
        SliverToBoxAdapter(child: verticalSpace(24)),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.pastelGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  AppIcons.package,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                horizontalSpace(12),
                Text(
                  LocaleKeys.shipments.tr(),
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(16)),

        // Show discounts section only when transactions exist
        SliverList.builder(
          itemCount: receiptModel.parcels!.length,
          itemBuilder: (context, index) {
            return ShipmentItemCard(parcel: receiptModel.parcels![index]);
          },
        ),

        if (receiptModel.transactions != null &&
            receiptModel.transactions!.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              margin: const EdgeInsets.only(right: 20, left: 20, bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.pastelGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.discount_rounded,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                  horizontalSpace(12),
                  Text(
                    'الخصومات',
                    style: AppTextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(12)),
          SliverList.builder(
            itemCount: receiptModel.transactions!.length,
            itemBuilder: (context, index) {
              final tx = receiptModel.transactions![index];
              return TransactionItemCard(transaction: tx);
            },
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
        ],
        SliverToBoxAdapter(child: verticalSpace(24)),
      ],
    ).withPadding(horizontal: 16, vertical: 20);
  }
}

// Simple transaction card used by the discounts section.
class TransactionItemCard extends StatelessWidget {
  const TransactionItemCard({super.key, required this.transaction});
  final TransactionsModel
  transaction; // can be Map<String, dynamic> or a model instance

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.pastelGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.receipt_long,
              color: AppColors.lightPrimaryColor,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: AppTextStyles.med14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                verticalSpace(6),
                // Show id and date on the second line
                Row(
                  children: [
                    Text(
                      'الرقم: ${transaction.id}',
                      style: AppTextStyles.reg12.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    horizontalSpace(12),
                    Text(
                      transaction.transactionDate,
                      style: AppTextStyles.reg12.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          horizontalSpace(12),
          Text(
            transaction.amount,
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.tertiaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
